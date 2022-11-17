

Config = {}
Config.UseTarget = false -- If you have a target script, it is setup by default for qr-target: https://github.com/QRCore-RedM-Re/qr-target
Config.Distance = 10.0 -- Distance to render peds


Config.Locations = {

	-------------------
	-- GENERAL STORE --
	-------------------
    { -- BLACKWATER
		model = "u_m_m_armgeneralstoreowner_01", 
		coords = vector4(-784.37, -1322.13, 42.88, 178.61),
		--animDict = "", 
		--animName = "", 
		options = Presets.GeneralStore, -- Presets are for the target script. Comment out or delete if not using.
		distance = 3.5,
    },
	{
		model = "u_m_m_armgeneralstoreowner_01", 
		coords = vector4(-324.05, 803.38, 116.88, 236.46),
		--animDict = "", 
		--animName = "", 
		options = Presets.GeneralStore, -- Presets are for the target script. Comment out or delete if not using.
		distance = 3.5,
    },

	{ -- RHODES
		model = "u_m_m_armgeneralstoreowner_01", 
		coords = vector4(1330.31, -1293.33, 76.02, 70.37),
		--animDict = "", 
		--animName = "", 
		options = Presets.GeneralStore, -- Presets are for the target script. Comment out or delete if not using.
		distance = 3.5,
    },
	{ -- Strawberry
		model = "u_m_m_armgeneralstoreowner_01", 
		coords = vector4(-1789.52, -387.6, 159.33, 51.31),
		--animDict = "", 
		--animName = "", 
		options = Presets.GeneralStore, -- Presets are for the target script. Comment out or delete if not using.
		distance = 3.5,
    },
	{ -- Saint Dennis
		model = "u_m_m_armgeneralstoreowner_01", 
		coords = vector4(2859.54, -1202.23, 48.59, 358.59),
		--animDict = "", 
		--animName = "", 
		options = Presets.GeneralStore, -- Presets are for the target script. Comment out or delete if not using.
		distance = 3.5,
	},
	---------------------
	-- GUN SMITH SHOPS --
	---------------------
	{
		model = "u_m_m_asbgunsmith_01", 
		coords = vector4(1322.23, -1322.94, 76.89, 342.75),
		--animDict = "", 
		--animName = "", 
		options = Presets.GunSmith,
		distance = 3.5,
    },
	{
		model = "u_m_m_asbgunsmith_01", 
		coords = vector4(-282.09, 778.94, 118.5, 352.21),
		--animDict = "", 
		--animName = "", 
		options = Presets.GunSmith,
		distance = 3.5,
    },
	------------
	-- BARBER --
	------------
	
	{
		model = "s_m_m_barber_01", 
		coords = vector4(-307.48, 814.25, 117.99, 162.26),
		--animDict = "", 
		--animName = "", 
		options = Presets.Barber,
		distance = 3.5,
    },
	{ -- Saint Dennis
		model = "s_m_m_barber_01", 
		coords = vector4(2652.86, -1180.15, 52.28, 306.49),
		--animDict = "", 
		--animName = "", 
		options = Presets.Barber,
		distance = 3.5,
    },
	{ -- Blackwater
		model = "s_m_m_barber_01", 
		coords = vector4(-815.85, -1365.39, 42.75, 232.66),
		--animDict = "", 
		--animName = "", 
		options = Presets.Barber,
		distance = 3.5,
	},
	

	------------
	-- DOCTOR --
	------------
	{ -- RHODES
		model = "u_m_m_rhddoctor_01", 
		coords = vector4(1368.66, -1311.4, 76.94, 137.47),
		--animDict = "", 
		--animName = "", 
		options = Presets.Doctor,
		distance = 3.5,
    },
	{ -- Saint Dennis
		model = "u_m_m_rhddoctor_01", 
		coords = vector4(2721.54, -1232.01, 49.37, 51.84),
		--animDict = "", 
		--animName = "", 
		options = Presets.Doctor,
		distance = 3.5,
	},
	{ -- Strawberry
		model = "u_m_m_rhddoctor_01", 
		coords = vector4(-1806.46, -429.25, 157.83, 186.35),
		--animDict = "", 
		--animName = "", 
		options = Presets.Doctor,
		distance = 3.5,
	},
	
}