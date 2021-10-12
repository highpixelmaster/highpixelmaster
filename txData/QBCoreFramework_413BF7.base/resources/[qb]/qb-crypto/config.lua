Crypto = {

    History = {
        ["qbit"] = {}
    },

    Worth = {
        ["qbit"] = 0
    },
    
    Labels = {
        ["qbit"] = "Bitcoin"
    },

    Exchange = {
        coords = vector3(173.06, -999.45, -97.95),
        RebootInfo = {
            state = false,
            percentage = 0
        },
    },

    -- For auto updating the value of qbit
    Coin = 'qbit',
    RefreshTimer = 10, -- In minutes, so every 10 minutes.

    -- Crashes or luck
    ChanceOfCrashOrLuck = 2, -- This is in % (1-100)
    Crash = {20,80}, -- Min / Max
    Luck = {10,30}, -- Min / Max

    -- If not not Chance of crash or luck, then this shit
    ChanceOfDown = 60, -- If out of 100 hits less or equal to
    ChanceOfUp = 40, -- If out of 100 is greater or equal to
    CasualDown = {20,80}, -- Min / Max (If it goes down)
    CasualUp = {10,30}, -- Min / Max (If it goes up)
}
