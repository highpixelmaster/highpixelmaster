Config = {}
Config.ShowUnlockedText = true
Config.AdminAccess = false

Config.DoorList = {}


-- 
table.insert(Config.DoorList, {
	garage = true,
	slides = true,
	maxDistance = 6.0,
	fixText = false,
	authorizedJobs = { ['mechanic']=0 },
	objHash = -427498890,
	locked = true,
	objHeading = 69.999923706055,
	objCoords = vector3(-44.1884, -1043.554, 27.80161),
	audioRemote = false,
	lockpick = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = false,
	slides = false,
	maxDistance = 2.0,
	fixText = false,
	authorizedJobs = { ['cardealer2']=0 },
	objHash = 2059227086,
	locked = true,
	objHeading = 330.0,
	objCoords = vector3(-69.58672, 64.7053, 72.11914),
	audioRemote = false,
	lockpick = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = false,
	slides = false,
	maxDistance = 2.0,
	fixText = false,
	authorizedJobs = { ['cardealer2']=0 },
	objHash = 2059227086,
	locked = true,
	objHeading = 150.0,
	objCoords = vector3(-67.93951, 63.76554, 72.11914),
	audioRemote = false,
	lockpick = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = true,
	slides = true,
	maxDistance = 6.0,
	fixText = false,
	authorizedJobs = { ['cardealer2']=0 },
	objHash = 2044752428,
	locked = true,
	objHeading = 246.0,
	objCoords = vector3(-62.28647, 79.83851, 72.33872),
	audioRemote = false,
	lockpick = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- UNNAMED DOOR CREATED BY LISPY
table.insert(Config.DoorList, {
	locked = true,
	objHash = -1320876379,
	maxDistance = 2.0,
	objCoords = vector3(-56.02399, 71.56345, 71.99021),
	slides = false,
	objHeading = 245.00003051758,
	lockpick = false,
	garage = false,
	authorizedJobs = { ['cardealer2']=0 },
	audioRemote = false,
	fixText = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	garage = false,
	objHeading = 249.98275756836,
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = false,
	objHash = 854291622,
	objCoords = vector3(313.4801, -595.4583, 43.43391),
	maxDistance = 2.0,
	locked = true,
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	garage = false,
	objHeading = 160.00003051758,
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = false,
	objHash = 854291622,
	objCoords = vector3(309.1337, -597.7515, 43.43391),
	maxDistance = 2.0,
	locked = true,
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = true,
	lockpick = false,
	maxDistance = 6.0,
	audioRemote = false,
	authorizedJobs = { ['ambulance']=0 },
	locked = false,
	doors = {
		{objHash = 661758796, objHeading = 250.03547668457, objCoords = vector3(300.0308, -583.7263, 42.28401)},
		{objHash = -487908756, objHeading = 249.96293640137, objCoords = vector3(299.2278, -585.9323, 42.28401)}
 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = true,
	lockpick = false,
	maxDistance = 6.0,
	audioRemote = false,
	authorizedJobs = { ['ambulance']=0 },
	locked = false,
	doors = {
		{objHash = -487908756, objHeading = 69.992195129395, objCoords = vector3(357.3348, -589.3868, 27.79682)},
		{objHash = 661758796, objHeading = 70.021705627441, objCoords = vector3(356.5311, -591.5957, 27.79682)}
 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	garage = false,
	objHeading = 250.00610351562,
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = false,
	objHash = 854291622,
	objCoords = vector3(348.5467, -585.1584, 28.94709),
	maxDistance = 2.0,
	locked = true,
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,
	authorizedJobs = { ['ambulance']=0 },
	locked = true,
	doors = {
		{objHash = -434783486, objHeading = 70.006050109863, objCoords = vector3(338.4467, -590.053, 28.94709)},
		{objHash = -1700911976, objHeading = 70.006050109863, objCoords = vector3(339.3266, -587.6345, 28.94709)}
 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	garage = true,
	objHeading = 160.00607299805,
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = true,
	objHash = -820650556,
	objCoords = vector3(337.2777, -564.432, 29.77529),
	maxDistance = 6.0,
	locked = true,
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	garage = true,
	objHeading = 160.00605773926,
	authorizedJobs = { ['ambulance']=0 },
	lockpick = false,
	slides = true,
	objHash = -820650556,
	objCoords = vector3(330.1349, -561.8331, 29.77529),
	maxDistance = 6.0,
	locked = true,
	audioRemote = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 180.00003051758,
	lockpick = false,
	authorizedJobs = { ['weedshop']=0 },
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(381.4216, -825.1628, 29.45322),
	garage = false,
	objHash = -538477509,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 180.00001525879,
	lockpick = false,
	authorizedJobs = { ['weedshop']=0 },
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(375.8304, -821.0286, 29.44885),
	garage = false,
	objHash = -311575617,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	lockpick = false,
	authorizedJobs = { ['weedshop']=0 },
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(376.8353, -817.5457, 29.44885),
	garage = false,
	objHash = -311575617,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = 149284793, objHeading = 0.0, objCoords = vector3(479.6638, -997.91, 26.4065)},
		{objHash = 149284793, objHeading = 180.00001525879, objCoords = vector3(482.0686, -997.91, 26.4065)}
 },
	slides = false,
	authorizedJobs = { ['police']=0 },
	audioRemote = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.5,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = 149284793, objHeading = 270.00003051758, objCoords = vector3(479.0624, -985.0323, 26.40548)},
		{objHash = 149284793, objHeading = 89.999977111816, objCoords = vector3(479.0624, -987.4376, 26.40548)}
 },
	slides = false,
	authorizedJobs = { ['police']=0 },
	audioRemote = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.5,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = 149284793, objHeading = 270.19003295898, objCoords = vector3(471.3679, -1007.793, 26.40548)},
		{objHash = 149284793, objHeading = 89.999977111816, objCoords = vector3(471.3758, -1010.198, 26.40548)}
 },
	slides = false,
	authorizedJobs = { ['police']=0 },
	audioRemote = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.5,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	doors = {
		{objHash = -288803980, objHeading = 180.00001525879, objCoords = vector3(469.9274, -1000.544, 26.40548)},
		{objHash = -288803980, objHeading = 0.0, objCoords = vector3(467.5222, -1000.544, 26.40548)}
 },
	slides = false,
	authorizedJobs = { ['police']=0 },
	audioRemote = false,
	lockpick = false,
	locked = true,
	maxDistance = 2.5,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 6.0,
	objCoords = vector3(-1193.198, -906.8282, 12.98282),
	garage = false,
	objHeading = 170.99998474121,
	lockpick = false,
	slides = true,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	objHash = -1518705307,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-1201.111, -892.9651, 14.24448),
	garage = false,
	objHeading = 34.000019073486,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	objHash = -1448591934,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	locked = true,
	doors = {
		{objHash = -186646702, objHeading = 213.99998474121, objCoords = vector3(-1199.029, -885.1664, 14.24046)},
		{objHash = 1934064671, objHeading = 213.99998474121, objCoords = vector3(-1196.543, -883.4891, 14.24046)}
 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	locked = true,
	doors = {
		{objHash = -186646702, objHeading = 123.99998474121, objCoords = vector3(-1184.902, -883.2943, 14.24046)},
		{objHash = 1934064671, objHeading = 123.99998474121, objCoords = vector3(-1183.221, -885.7863, 14.24046)}
 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-1179.221, -891.5005, 14.094),
	garage = false,
	objHeading = 124.0,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	objHash = -1300743830,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-1182.097, -895.4975, 14.1383),
	garage = false,
	objHeading = 213.99998474121,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	objHash = 1042741067,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	maxDistance = 2.0,
	objCoords = vector3(-1199.357, -903.8741, 14.07984),
	garage = false,
	objHeading = 304.0,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['burgershot']=0 },
	audioRemote = false,
	objHash = -1300743830,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	locked = true,
	doors = {
		{objHash = 21324050, objHeading = 57.999977111816, objCoords = vector3(926.4382, 47.46822, 81.53419)},
		{objHash = 21324050, objHeading = 238.00001525879, objCoords = vector3(927.7739, 49.59499, 81.53419)}
 },
	items = { 'admin' },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	maxDistance = 2.5,
	slides = false,
	locked = true,
	doors = {
		{objHash = 21324050, objHeading = 238.00001525879, objCoords = vector3(924.7853, 44.82212, 81.53419)},
		{objHash = 21324050, objHeading = 57.999977111816, objCoords = vector3(923.4505, 42.69615, 81.53419)}
 },
	items = { 'admin' },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 328.00003051758,
	items = { 'admin' },
	maxDistance = 6.0,
	garage = true,
	slides = true,
	locked = true,
	objHash = -1957832210,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(936.9142, 2.19565, 77.77524),
	fixText = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 

-- 
table.insert(Config.DoorList, {
	objHeading = 159.99998474121,
	items = { 'security_card_02' },
	authorizedJobs = { ['police']=0 },
	garage = false,
	slides = false,
	maxDistance = 2.0,
	objCoords = vector3(251.8576, 221.0655, 101.8324),
	locked = true,
	lockpick = false,
	objHash = -1508355822,
	audioRemote = false,
	fixText = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 250.0,
	items = { 'security_card_02' },
	authorizedJobs = { ['police']=0 },
	garage = false,
	slides = false,
	maxDistance = 2.0,
	objCoords = vector3(261.3004, 214.5051, 101.8324),
	locked = true,
	lockpick = false,
	objHash = -1508355822,
	audioRemote = false,
	fixText = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 315.00006103516,
	items = { 'security_card_01' },
	authorizedJobs = { ['police']=0 },
	garage = false,
	slides = false,
	maxDistance = 2.0,
	objCoords = vector3(-106.4713, 6476.158, 31.9548),
	locked = true,
	lockpick = false,
	objHash = 1309269072,
	audioRemote = false,
	fixText = false,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 293.00003051758,
	fixText = false,
	authorizedJobs = { ['ambulance']=0, ['police']=0 },
	maxDistance = 2.0,
	audioRemote = false,
	lockpick = false,
	objCoords = vector3(-440.6439, -321.7954, 35.06683),
	garage = false,
	objHash = 493136920,
	slides = false,
	locked = true,        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 270.00003051758,
	maxDistance = 6.0,
	objHash = -190780785,
	fixText = false,
	lockpick = false,
	garage = true,
	audioRemote = false,
	locked = true,
	objCoords = vector3(459.5504, -1014.646, 29.10957),
	slides = true,
	authorizedJobs = { ['police']=0 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 270.00003051758,
	maxDistance = 6.0,
	objHash = -190780785,
	fixText = false,
	lockpick = false,
	garage = true,
	audioRemote = false,
	locked = true,
	objCoords = vector3(459.5504, -1019.699, 29.08874),
	slides = true,
	authorizedJobs = { ['police']=0 },        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000
})