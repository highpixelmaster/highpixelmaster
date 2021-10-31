Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25

Consumeables = {
    ["sandwich"] = math.random(35, 54),
    ["water_bottle"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["kurkakola"] = math.random(35, 54),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["coffee"] = math.random(40, 50),
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["burger-bleeder"] = math.random(35, 54),
["burger-moneyshot"] = math.random(35, 54),
["burger-torpedo"] = math.random(35, 54),
["burger-heartstopper"] = math.random(35, 54),
["burger-meatfree"] = math.random(35, 54),
["burger-fries"] = math.random(35, 54),
["candycorn"] = math.random(5, 10),
["candypumpkins"] = math.random(4, 5),
["candyghosts"] = math.random(1, 10),
["candypeppermint"] = math.random(5, 9),
["candyworm"] = math.random(2, 4),
["candygum"] = math.random(5, 7),


--Drinks
["burger-softdrink"] = math.random(40, 50),
["burger-mshake"] = math.random(40, 50),

}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,    
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
        
    },
    --Courthouse
    [2] = {
        [1] = {
            coords = vector4(330.73, -1648.85, 32.53, 322.08),
            ["AllowVehicle"] = false, 
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(329.67, -1650.13, 60.53, 317.29),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    --Pillbox
    [3] = {
        [2] = {
            coords = vector4(330.41, -601.11, 43.28, 73.1),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
        [1] = {
            coords = vector4(344.28, -586.2, 28.8, 254.37),
            ["AllowVehicle"] = false, 
            drawText = '[E] Take Elevator Up - Main Floor'
        },
    },
    [4] = {
        [1] = {
            coords = vector4(340.11, -584.59, 28.8, 77.74),
            ["AllowVehicle"] = false, 
            drawText = '[E] Take Elevator Up - Main Floor'
        },
        [2] = {
            coords = vector4(332.41, -595.71, 43.28, 64.77),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    [5] = {
        [1] = {
            coords = vector4(341.43, -580.99, 28.8, 71.35),
            ["AllowVehicle"] = false, 
            drawText = '[E] Take Elevator Up - Roof'
        },
        [2] = {
            coords = vector4(338.65, -583.72, 74.16, 252.22),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down - Employee Garage'
        },
    },
        --Weapon
        [6] = {
            [1] = {
                coords = vector4(-787.06, -911.92, 18.09, 265.27),
                ["AllowVehicle"] = false, 
                drawText = '[E] Enter Building'
            },
            [2] = {
                coords = vector4(178.9, -1000.12, -99.0, 182.57),
                ["AllowVehicle"] = false,
                drawText = '[E] Exit Building'
            },
        },
        -- Court Holding
        [7] = {
            [1] = {
                coords = vector4(345.09, -1644.31, 32.53, 132.72),
                ["AllowVehicle"] = false, 
                drawText = '[E] Enter Holding'
            },
            [2] = {
                coords = vector4(337.39, -1619.88, 60.53, 142.62),
                ["AllowVehicle"] = false,
                drawText = '[E] Exit Holding'
            },
        },
}