# Give Skinwalker their starting items

give @s minecraft:stick{display:{Name:'{"text":"Skinwalker Claws","color":"dark_red","italic":false}',Lore:['{"text":"Right-click to use your ability","color":"gray"}']}} 1
give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Teleport behind your target","color":"gray"}']}} 2

effect give @s minecraft:invisibility 1 0 true
effect give @s minecraft:night_vision 999999 0 true

tellraw @s ["",{"text":"[ABILITIES]","color":"dark_red"},{"text":" You can right-click players to infect them"}]
tellraw @s ["",{"text":"[OBJECTIVE]","color":"red"},{"text":" Eliminate all survivors before they complete their tasks"}]
