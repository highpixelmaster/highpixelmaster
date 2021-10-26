Config = {}

Config.Jobs = {
    ["electrician"] = "Electrician",
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1761.46, 2540.41, 45.56, 272.249),
            },
            [2] = {
                coords = vector4(1718.54, 2527.802, 45.56, 272.249),
            },
            [3] = {
                coords = vector4(1700.199, 2474.811, 45.56, 272.249),
            },
            [4] = {
                coords = vector4(1664.827, 2501.58, 45.56, 272.249),
            },
            [5] = {
                coords = vector4(1621.622, 2509.302, 45.56, 272.249),
            },
            [6] = {
                coords = vector4(1627.936, 2538.393, 45.56, 272.249),
            },
            [7] = {
                coords = vector4(1625.1, 2575.988, 45.56, 272.249),
            },
        },
    },
    ["freedom"] = {
        coords = vector4(1831.99, 2580.44, 46.01, 0),
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 45.67, 269.5),
    },
    ["yard"] = {
        coords = vector4(1753.55, 2550.18, 45.57, 1.5),
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 45.55, 123.5),
    },
    ["shop"] = {
        coords = vector4(1832.15, 2580.44, 46.01, 163.54),
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = vector4(1756.18, 2472.38, 47.41, 299.93),
        },
        [2] = {
            animation = "lean",
            coords = vector4(1743.14, 2477.68, 45.81, 299.88),
        },
        [3] = {
            animation = "lean",
            coords = vector4(1750.43, 2469.05, 45.81, 114.09),
        },
        [4] = {
            animation = "lean",
            coords = vector4(1774.33, 2488.51, 50.42, 120.49),
        },
        [5] = {
            animation = "sitchair4",
            coords = vector4(1766.41, 2491.08, 45.82, 219.9),
        },
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}
