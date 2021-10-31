Config = {}

Config.DefaultVolume = 0.1 -- Accepted values are 0.01 - 1

Config.Locations = {
    ['pd'] = {
        ['job'] = 'police', -- Required job to use booth
        ['radius'] = 50, -- The radius of the sound from the booth
        ['coords'] = vector3(441.03, -991.94, 25.7) -- Where the booth is located
    },
    ['tuner'] = {
        ['job'] = 'mechanic2',
        ['radius'] = 30,
        ['coords'] = vector3(139.79, -3033.06, 7.05)
    }
}