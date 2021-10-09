# qb-skateboard
This is a simple skateboard script that was pulled from https://github.com/DimitriTimoz/ElectricSkateboardFiveM the only changes I made to this script is making it so the skateboard is an item and not used by a command.

## I have added an image for the skateboard as well!

Add the image into your qb-inventory images folder.

## Place this into your qb-core shared.lua

```
["skateboard"] 		 	 		 = {["name"] = "skateboard", 					["label"] = "Skateboard", 			["weight"] = 1425, 		["type"] = "item", 			["image"] = "skateboard.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A cool skateboard!"}, 
```

### Press G to get on/off the board and E to pick it up!
