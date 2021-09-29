Crypto = {

    History = {
        ["btc"] = {}
    },

    Worth = {
        ["btc"] = 0
    },
    
    Labels = {
        ["btc"] = "Bitcoin"
    },

    Exchange = {
        coords = vector3(173.0, -999.45, -97.95),
        RebootInfo = {
            state = false,
            percentage = 0
        },
    },

    -- For auto updating the value of qbit
    Coin = 'btc',
    RefreshTimer = 1, -- In minutes, so every 10 minutes.

    -- Crashes or luck
    ChanceOfCrashOrLuck = 2, -- This is in % (1-100)
    Crash = {40,99}, -- Min / Max
    Luck = {20,99}, -- Min / Max

    -- If not not Chance of crash or luck, then this shit
    ChanceOfDown = 50, -- If out of 100 hits less or equal to
    ChanceOfUp = 50, -- If out of 100 is greater or equal to
    CasualDown = {1,10}, -- Min / Max (If it goes down)
    CasualUp = {1,5}, -- Min / Max (If it goes up)
}
