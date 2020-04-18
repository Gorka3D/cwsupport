PLUGIN.gunData = {}
PLUGIN.modelCam = {}

PLUGIN.slotCategory = {
	[1] = "secondary",
	[2] = "primary",
	[3] = "primary",
	[4] = "primary",
}

-- I don't want to make them to buy 50 different kind of ammo
PLUGIN.changeAmmo = {
	["7.92x33mm Kurz"] = "ar2",
	["300 AAC Blackout"] = "ar2",
	["5.7x28mm"] = "ar2",
	["7.62x25mm Tokarev"] = "smg1",
	[".50 BMG"] = "ar2",
	["5.56x45mm"] = "ar2",
	["7.62x51mm"] = "ar2",
	["7.62x31mm"] = "ar2",
	["Frag Grenades"] = "grenade",
	["Flash Grenades"] = "grenade",
	["Smoke Grenades"] = "grenade",
	["9x17MM"] = "pistol",
	["9x19MM"] = "pistol",
	["9x19mm"] = "pistol",
	[".45 ACP"] = "pistol",
	["9x18MM"] = "pistol",
	["9x39MM"] = "pistol",
	[".40 S&W"] = "pistol",
	[".44 Magnum"] = "357",
	[".50 AE"] = "357",
	["5.45x39MM"] = "ar2",
	["5.56x45MM"] = "ar2",
	["5.7x28MM"] = "ar2",
	["7.62x51MM"] = "ar2",
	["7.62x54mmR"] = "ar2",
	["12 Gauge"] = "buckshot",
	[".338 Lapua"] = "sniperround",
}

local AMMO_BOX = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_CASE = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_FLARE = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_BIGBOX = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_BUCKSHOT = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_GREN = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"
local AMMO_AR2AltFire = "models/z-o-m-b-i-e/metro_ll/box/m_ll_box_metal_07.mdl"

PLUGIN.ammoInfo = {}
PLUGIN.ammoInfo["pistol"] = {
	name = "Municion de Pistola",
	desc = "Una caja de municion que contiene 90 balas de pistola",
	amount = 90,
	price = 180,
	model = AMMO_CASE,
	maxQuantity = 90,
}
PLUGIN.ammoInfo["357"] = {
	name = "Balas de Rodamiento",
	amount = 30,
	price = 200,
	model = AMMO_CASE,
	maxQuantity = 30,
}
PLUGIN.ammoInfo["smg1"] = {
	name = "Municion de Subfusil",
	desc = "Una caja de municion que contiene 90 balas de subfusil",
	amount = 90,
	price = 180,
	model = AMMO_BOX,
	maxQuantity = 90,
}
PLUGIN.ammoInfo["ar2"] = {
	name = "Municion de Fusil",
	amount = 90,
	price = 250,
	model = AMMO_BIGBOX,
	maxQuantity = 90,
}
PLUGIN.ammoInfo["buckshot"] = {
	name = "Municion de Escopeta",
	amount = 24,
	price = 170,
	model = AMMO_BUCKSHOT,
	maxQuantity = 24,
}
PLUGIN.ammoInfo["AR2AltFire"] = {
	name = "Municion Pesada",
	amount = 300,
	price = 250,
	model = AMMO_AR2AltFire,
	maxQuantity = 300,
}
PLUGIN.ammoInfo["sniperround"] = {
	name = "Municion de Francotirador",
	amount = 30,
	price = 210,
	model = AMMO_FLARE,
	maxQuantity = 30,
}

nut.util.include("presets/sh_defcw.lua")
nut.util.include("presets/sh_customweapons.lua")

