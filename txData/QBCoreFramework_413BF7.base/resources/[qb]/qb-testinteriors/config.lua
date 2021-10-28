--[[
	!! IMPORTANT
		You will need these:
		https://k4mb1.tebex.io/package/4741607

		Then you need to uncomment optional.lua in qb-interiors
]]--

CONFIG = {}

CONFIG.export = exports['qb-interior']

CONFIG.zoffset = 30

CONFIG.interiors = {}

CONFIG.interiors[1] = function(coords)
	return CONFIG.export:CreateApartmentShell(coords)
end

CONFIG.interiors[2] = function(coords)
	return CONFIG.export:CreateTier1House(coords)
end

CONFIG.interiors[3] = function(coords)
	return CONFIG.export:CreateTrevorsShell(coords)
end

CONFIG.interiors[4] = function(coords)
	return CONFIG.export:CreateCaravanShell(coords)
end

CONFIG.interiors[5] = function(coords)
	return CONFIG.export:CreateLesterShell(coords)
end

CONFIG.interiors[6] = function(coords)
	return CONFIG.export:CreateRanchShell(coords)
end

CONFIG.interiors[7] = function(coords)
	return exports['qb-interior']:CreateWarehouse1(coords)
end

CONFIG.interiors[8] = function(coords)
	return exports['qb-interior']:CreateWarehouse2(coords)
end

CONFIG.interiors[9] = function(coords)
	return exports['qb-interior']:CreateWarehouse3(coords)
end

CONFIG.interiors[10] = function(coords)
	return exports['qb-interior']:CreateHighend1(coords)
end

CONFIG.interiors[11] = function(coords)
	return exports['qb-interior']:CreateHighend2(coords)
end

CONFIG.interiors[12] = function(coords)
	return exports['qb-interior']:CreateHighend3(coords)
end

CONFIG.interiors[13] = function(coords)
	return exports['qb-interior']:CreateHighend(coords)
end

CONFIG.interiors[14] = function(coords)
	return exports['qb-interior']:CreateHighendV2(coords)
end

CONFIG.interiors[15] = function(coords)
	return exports['qb-interior']:CreateMichael(coords)
end

CONFIG.interiors[16] = function(coords)
	return exports['qb-interior']:CreateOffice2(coords)
end

CONFIG.interiors[17] = function(coords)
	return exports['qb-interior']:CreateOfficeBig(coords)
end

CONFIG.interiors[18] = function(coords)
	return exports['qb-interior']:CreateBarber(coords)
end

CONFIG.interiors[19] = function(coords)
	return exports['qb-interior']:CreateGunstore(coords)
end

CONFIG.interiors[20] = function(coords)
	return exports['qb-interior']:CreateStore1(coords)
end

CONFIG.interiors[21] = function(coords)
	return exports['qb-interior']:CreateStore2(coords)
end

CONFIG.interiors[22] = function(coords)
	return exports['qb-interior']:CreateStore3(coords)
end

CONFIG.interiors[23] = function(coords)
	return exports['qb-interior']:CreateFranklinAunt(coords)
end

CONFIG.interiors[24] = function(coords)
	return exports['qb-interior']:CreateMedium2(coords)
end

CONFIG.interiors[25] = function(coords)
	return exports['qb-interior']:CreateMedium3(coords)
end

CONFIG.interiors[26] = function(coords)
	return exports['qb-interior']:CreateCoke(coords)
end

CONFIG.interiors[27] = function(coords)
	return exports['qb-interior']:CreateCoke2(coords)
end

CONFIG.interiors[28] = function(coords)
	return exports['qb-interior']:CreateMeth(coords)
end

CONFIG.interiors[29] = function(coords)
	return exports['qb-interior']:CreateWeed2(coords)
end

CONFIG.interiors[30] = function(coords)
	return exports['qb-interior']:CreateGarageLow(coords)
end

CONFIG.interiors[31] = function(coords)
	return exports['qb-interior']:CreateGarageMed(coords)
end

CONFIG.interiors[32] = function(coords)
	return exports['qb-interior']:CreateGarageHigh(coords)
end

CONFIG.interiors[33] = function(coords)
	return CONFIG.export:CreateContainer2(coords)
end

CONFIG.interiors[34] = function(coords)
	return CONFIG.export:CreateFurniStash1(coords)
end

CONFIG.interiors[35] = function(coords)
	return CONFIG.export:CreateFurniStash3(coords)
end

CONFIG.interiors[36] = function(coords)
	return CONFIG.export:CreateWarehouse1(coords)
end

CONFIG.interiors[37] = function(coords)
	return CONFIG.export:CreateWarehouse2(coords)
end

CONFIG.interiors[38] = function(coords)
	return CONFIG.export:CreateWarehouse3(coords)
end

CONFIG.interiors[39] = function(coords)
	return CONFIG.export:CreateK4Coke(coords)
end

CONFIG.interiors[40] = function(coords)
	return CONFIG.export:CreateK4Meth(coords)
end

CONFIG.interiors[41] = function(coords)
	return CONFIG.export:CreateK4Weed(coords)
end

CONFIG.interiors[42] = function(coords)
	return CONFIG.export:CreateContainer2(coords)
end

CONFIG.interiors[43] = function(coords)
	return CONFIG.export:CreateFurniStash1(coords)
end

CONFIG.interiors[44] = function(coords)
	return CONFIG.export:CreateFurniStash3(coords)
end

CONFIG.interiors[45] = function(coords)
	return CONFIG.export:CreateFurniLow(coords)
end

CONFIG.interiors[46] = function(coords)
	return CONFIG.export:CreateFurniMid(coords)
end

CONFIG.interiors[47] = function(coords)
	return CONFIG.export:CreateFurniMotel(coords)
end

CONFIG.interiors[48] = function(coords)
	return CONFIG.export:CreateFurniMotelClassic(coords)
end

CONFIG.interiors[49] = function(coords)
	return CONFIG.export:CreateFurniMotelStandard(coords)
end

CONFIG.interiors[50] = function(coords)
	return CONFIG.export:CreateFurniMotelHigh(coords)
end

CONFIG.interiors[51] = function(coords)
	return CONFIG.export:CreateFurniMotelModern(coords)
end

CONFIG.interiors[52] = function(coords)
	return CONFIG.export:CreateFurniMotelModern2(coords)
end

CONFIG.interiors[53] = function(coords)
	return CONFIG.export:CreateFurniMotelModern3(coords)
end

CONFIG.interiors[54] = function(coords)
	return CONFIG.export:CreateCoke(coords)
end

CONFIG.interiors[55] = function(coords)
	return CONFIG.export:CreateCoke2(coords)
end

CONFIG.interiors[56] = function(coords)
	return CONFIG.export:CreateMeth(coords)
end

CONFIG.interiors[57] = function(coords)
	return CONFIG.export:CreateWeed(coords)
end

CONFIG.interiors[58] = function(coords)
	return CONFIG.export:CreateWeed2(coords)
end