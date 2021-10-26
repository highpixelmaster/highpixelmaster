exports['qb-target']:AddBoxZone("Stash1", vector3(-56.01, -1209.86, 28.58), 5.8, 0.6, {
	name="Stash1",
    heading=45,
debugPoly=false,
minZ=27.38,
maxZ=31.38
	}, {
		options = {
            {
                event = "qb-stopragelockers:StashAvailability1",
                icon = "fas fa-warehouse",
                label = "Open Storage",
            },
		},
		distance = 5
	})

exports['qb-target']:AddBoxZone("Stash2", vector3(-61.31, -1204.76, 28.08), 5.2, 0.6, {
    name="Stash2",
    heading=44,
    debugPoly=false,
    minZ=27.08,
    maxZ=31.08
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability2",
                icon = "fas fa-warehouse",
                label = "Open Storage",
            },
        },
        distance = 5
    })

    exports['qb-target']:AddBoxZone("Stash3", vector3(-67.5, -1198.46, 27.78), 6.8, 0.6, {
        name="Stash3",
        heading=45,
        debugPoly=false,
        minZ=26.78,
        maxZ=30.78
        }, {
            options = {
                {
                    event = "qb-stopragelockers:StashAvailability3",
                    icon = "fas fa-warehouse",
                    label = "Open Storage",
                },
            },
            distance = 5
        })

        exports['qb-target']:AddBoxZone("Stash4", vector3(-73.76, -1196.62, 27.66), 6.8, 0.6, {
            name="Stash4",
            heading=90,
            debugPoly=false,
            minZ=26.86,
            maxZ=30.86
            }, {
                options = {
                    {
                        event = "qb-stopragelockers:StashAvailability4",
                        icon = "fas fa-warehouse",
                        label = "Open Storage",
                    },
                },
                distance = 5
            })