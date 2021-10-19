
-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("BurgerShotDuty", vector3(-1191.61, -900.65, 13.98), 1.4, 1, {
		name = "BurgerShotDuty",
		heading = 35,
		debugPoly = false,
	}, {
		options = {
		    {  
			event = "qb-burgershot:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "burgershot",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("burger_tray_1", vector3(-1195.96, -891.32, 13.98), 0.5, 1.1, {
			name = "burger_tray_1",
            heading=35,
            --debugPoly=true,
            minZ=10.58,
            maxZ=14.58
		}, {
			options = {
			    {
				event = "qb-burgershot:Tray1",
				icon = "far fa-clipboard",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})

	exports['qb-target']:AddBoxZone("burger_tray_2", vector3(-1195.34, -892.29, 13.98), 0.5, 1.3, {
		name="burger_tray_2",
        heading=35,
        --debugPoly=true,
        minZ=10.58,
        maxZ=14.58
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray4",
			icon = "far fa-clipboard",
			label = "Tray 2",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("burger_tray_3", vector3(-1194.92, -892.81, 13.98), 0.5, 1.1, {
		name="burger_tray_3",
        heading=35,
        --debugPoly=true,
        minZ=10.38,
        maxZ=14.38
	}, {
		options = {
		    {
			event = "qb-burgershot:Tray3",
			icon = "far fa-clipboard",
			label = "Tray 3",
		    },
		},
		distance = 3.5
	})


	exports['qb-target']:AddBoxZone("burgershotcooker", vector3(-1202.82, -897.27, 13.98), 1.5, 1.3, {
		name="burgershotcooker",
        heading=35,
        --debugPoly=true,
        minZ=10.58,
        maxZ=14.58
	}, {
		options = {
			{
				event = "qb-burgershot:PattyFry",
				icon = "fas fa-hamburger",
				label = "Burger Cook Station",
				job = "burgershot",
			},
		},
		distance = 1.5
	})


		exports['qb-target']:AddBoxZone("burgershotfryer", vector3(-1201.97, -898.71, 13.98), 1.6, 1.5, {
		name="burgershotfryer",
        heading=35,
        --debugPoly=true,
        minZ=10.58,
        maxZ=14.58
		}, {
		    options = {
			{
			    event = "qb-burgershot:Fries",
			    icon = "fas fa-box",
			    label = "Make Fries",
			    job = "burgershot",
			},
		    },
		    distance = 1.5
		})


	exports['qb-target']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
	    name="burgershotdrinks",
	    heading=34,
	    debugPoly=false,
	    minZ=13.8,
	    maxZ=14.8,
	    }, {
		options = {
		    {
			event = "nh-context:DrinkMenu",
			icon = "fas fa-filter",
			label = "Make Some Drinks",
			job = "burgershot",
		    },
		},
		distance = 1.5
	    })

        exports['qb-target']:AddBoxZone("burgershotdrinks2", vector3(-1189.08, -905.28, 14.0), 1.15, 0.7, {
            name="burgershotdrinks2",
            heading=33,
            debugPoly=false,
            minZ=13.8,
            maxZ=14.8,
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

            
        exports['qb-target']:AddBoxZone("burgershotdrinks3", vector3(-1189.94, -904.21, 13.98), 2.4, 1.0, {
            name="burgershotdrinks3",
            heading=35,
            debugPoly=false,
            minZ=13.78,
            maxZ=14.98
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


         exports['qb-target']:AddBoxZone("burgerfridge", vector3(-1203.71, -895.86, 14.0), 1.6, 1, {
            name="burgerfridge",
            heading=35,
            debugPoly=false,
            minZ=13.0,
            maxZ=15.6,
        }, {
                options = {
                    {
                        event = "nh-context:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
            name="burgershotdisplay",
            heading=34,
            debugPoly=false,
            minZ=13.0,
            maxZ=14.8,
        }, {
                options = {
                    {
                        event = "qb-burgershot:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftburger", vector3(-1199.61, -898.06, 13.98), 1.2, 1.0, {
            name="craftburger",
            heading=35,
            --debugPoly=true,
            minZ=10.58,
            maxZ=14.58
        }, {
                options = {
                    {
                        event = "nh-context:Burgers",
                        icon = "fas fa-cheeseburger",
                        label = "Burger Work Station",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("BurgerShot_register_1", vector3(-1196.28, -890.79, 13.98), 0.4, 1.0, {
            name="BurgerShot_register_1",
            heading=35,
            --debugPoly=true,
            minZ=10.58,
            maxZ=14.58,
        }, {
                options = {
                    {
                        event = "qb-burgershot:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "burgershot",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("BurgerShot_register_2", vector3(-1195.34, -892.29, 13.98), 0.5, 1.3, {
            name="BurgerShot_register_2",
            name="r2",
            heading=35,
            --debugPoly=true,
            minZ=10.58,
            maxZ=14.58
            }, {
                    options = {
                        {
                            event = "qb-burgershot:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "burgershot",
                        },
                    },
                    distance = 1.5
                })  


        exports['qb-target']:AddBoxZone("BurgerShot_register_3", vector3(-1194.25, -893.92, 13.98), 0.5, 1.1, {
            name="BurgerShot_register_3",
            heading=35,
            --debugPoly=true,
            minZ=10.58,
            maxZ=14.58
                    }, {
                            options = {
                                {
                                    event = "qb-burgershot:bill",
                                    parms = "3",
                                    icon = "fas fa-credit-card",
                                    label = "Charge Customer",
                                    job = "burgershot",
                                },
                            },
                            distance = 1.5
                        })  

                        exports['qb-target']:AddBoxZone("BurgerShot_register_4", vector3(-1192.82, -906.38, 13.98), 1, 1, {
                            name="BurgerShot_register_4",
                            heading=35,
                            --debugPoly=true,
                                    }, {
                                            options = {
                                                {
                                                    event = "qb-burgershot:bill",
                                                    parms = "3",
                                                    icon = "fas fa-credit-card",
                                                    label = "Charge Customer",
                                                    job = "burgershot",
                                                },
                                            },
                                            distance = 1.5
                                        })                        



end)


-- NH - Context --

RegisterNetEvent('nh-context:Burgers', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Available Burgers |",
            txt = "",
        },
        {
            id = 1,
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MoneyShot"
            }
        },
        {
            id = 2,
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:MeatFree"
            }
        },
        {
            id = 3,
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:BleederBurger"
            }
        },
        {
            id = 4,
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:HeartStopper"
            }
        },
        {
            id = 5,
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-burgershot:Torpedo"
            }
        },
        {
            id = 6,
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-burgershot:CreateMurderMeal"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
            id = 2,
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Drink Menu |",
            txt = "",
        },
        {
            id = 1,
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:SoftDrink"
            }
        },
        {
            id = 2,
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:mShake"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-burgershot:bill:player", bill[1].input, bill[2].input)
    end
end)

