# Exports
```
-- This export returns the entity id of the ped that was created.
exports["ped-spawner"]:AddPed(model, coords, animDict, animName, scenario, options, distance)

-- This export will remove a ped from the list by entity id.
exports["ped-spawner"]:RemovePed(id)
```

# Presets
These are used if you have Target enabled in the config.
You can add as many presets as you like.
```
Presets.GeneralStore = {
    {
        event = "YourEventHere",
        icon = "fas fa-circle",
        label = "Supplies",
    },
}
Presets.GunSmith = {
    {
        event = "YourEventHere",
        icon = "fas fa-circle",
        label = "Gun Smith",
    },
}

Presets.Barber = {
    {
        event = "YourEventHere",
        icon = "fas fa-circle",
        label = "Barber",
    },
}

Presets.Doctor = {
    {
        event = "YourEventHere",
        icon = "fas fa-circle",
        label = "Visit Doctor",
    },
}
```