local SetEntityAlpha = SetEntityAlpha
local GetEntityCoords = GetEntityCoords
local PlayerPedId = PlayerPedId

local HasModelLoaded = HasModelLoaded
local RequestModel = RequestModel
local Wait = Wait

local PEDS = {}

local function CreateNPC(model, coords, options, distance, animDict, animName, scenario)
	CreateThread(function()
		if IsModelValid(model) then
			RequestModel(model)
			while not HasModelLoaded(model) do Wait(0) end
		else
			print("Invalid model: " .. model)
		end
		local ped = CreatePed(model, coords.xyz, coords.w, 0, 0, 0, 0)
		while not ped do Wait(0) end
		Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- _SET_RANDOM_OUTFIT_VARIATION
		
		SetEntityAlpha(ped, 0, false)
			
		FreezeEntityPosition(ped, true) -- Freeze the location the entity is spawned at.
	
		Citizen.InvokeNative(0xA5C38736C426FCB8, ped, true) -- SET_ENTITY_INVINCIBLE
		SetPedConfigFlag(ped, 26, true) -- Disable Melee targeting on ped. More Flags can be found here: https://github.com/femga/rdr3_discoveries/tree/master/AI/CPED_CONFIG_FLAGS
	
		Citizen.InvokeNative(0x013A7BA5015C1372, ped, true) -- _SET_PED_IGNORE_DEAD_BODIES
		Citizen.InvokeNative(0x9F8AA94D6D97DBF4, ped, true) -- SET_BLOCKING_OF_NON_TEMPORARY_EVENTS
		Citizen.InvokeNative(0xFAEE099C6F890BB8, ped, 4 + 16, 0) -- SET_ENTITY_PROOFS
	
		if scenario then
			TaskStartScenarioInPlace(ped, scenario, 0, true)
		elseif animDict and animName then
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do Wait(0) end
			TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
		end
	
		for i = 0, 255, 25 do
			Wait(50)
			SetEntityAlpha(ped, i, false)
		end
	
		if Config.UseTarget then
			if options then
				if not distance then distance = 3.5 end
				exports['qr-target']:AddTargetEntity(ped, {
					options = options,
					distance = distance,
				})
			end
		end
	
		PEDS[ped] = ped
		return ped
	end)
end

CreateThread(function()
	while true do
		for i = 1, #Config.Locations, 1 do
			v = Config.Locations[i]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords.xyz)

			if dist < Config.Distance and not v.rendered then
				v.ped = CreateNPC(v.model, v.coords, v.options, v.distance, v.animDict, v.animName, v.scenario)
				v.rendered = true
			end
			
			if dist >= Config.Distance and v.rendered then
				for i = 255, 0, -51 do
					Wait(50)
					SetEntityAlpha(v.ped, i, false)
				end
				if v.ped and DoesEntityExist(v.ped) then
					DeletePed(v.ped)
					PEDS[v.ped] = nil

					if Config.UseTarget and v.options then
						exports["qr-target"]:RemoveTargetEntity(v.ped)
					end
				end
				v.ped = nil
				v.rendered = false
			end
		end
		Wait(1000)
	end
end)

AddEventHandler('onResourceStop', function(name)
    if name == GetCurrentResourceName() then
		for k,_ in pairs(PEDS) do
			DeletePed(k)
			if Config.UseTarget then
				exports["qr-target"]:RemoveTargetEntity(k)
			end
		end
    end
end)

local function AddPed(model, coords, options, distance, animDict, animName)
	if not model then return end
	if not coords then return end
	if not options then options = {} end
	if not distance then distance = 3.5 end
	if not animDict then animDict = false end
	if not animName then animName = false end

	local index = #Config.Locations+1
	Config.Locations[index] = {
		model = model,
		coords = coords,
		animDict = animDict,
		animName = animName,
	    rendered = false,
        ped = nil,
		options = options,
		distance = distance,
	}
	return index
end
exports("AddPed", AddPed)

local function RemovePed(index)
	if Config.Locations[index] then
		if Config.Locations[index].ped then
			DeletePed(Config.Locations[index].ped)
			if Config.UseTarget then
				exports["qr-target"]:RemoveTargetEntity(Config.Locations[index].ped)
			end
		end

		if PEDS[Config.Locations[index].ped] then
			PEDS[Config.Locations[index].ped] = nil
		end

		Config.Locations[index] = nil
	end
end
exports("RemovePed", RemovePed)