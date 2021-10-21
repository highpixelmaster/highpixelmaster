Config = {}

----------optional section for shop to sell items-------------
Config.shop = {
    name = "CPU Store",
    coords = vector3(-1270.59, -305.29, 37.07),
}

Config.ShopItems = {
    label = "Macro Center",
    items = {
        [1] = {
            name = "gpu1",
            price = 200,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
    },
    slots = 3
}
----------------------------end of optional section--------------
 
Config.ExitCoords = vector4(-185.3246, -759.1964, 30.454008, 334.09106) -- coords to enter the mining facility


Config.MiningLab = {
   
    coords = vector3(2155.0, 2921.08, -81.08),
    mining_time =
    {
        ["RTX 2070"] = 60, -- mining time for different rigs in seconds.
        ["5700 XT"] = 120,
        ["3060 Ti"] = 180,
    } 
}

-- rewards for each rig in crypto-------
Config.Reward = {
    ["RTX 2070"] = 1, 
    ["5700 XT"] = math.random(2, 3),
    ["3060 Ti"] = math.random(4, 5),
}
