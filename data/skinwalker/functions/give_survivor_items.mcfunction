# Give Survivor their starting items

give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],Lore:['{"text":"Right-click to check tasks","color":"gray"}']} 1
give @s minecraft:clock{display:{Name:'{"text":"Emergency Beacon","color":"yellow","italic":false}',Lore:['{"text":"Reveal nearby Skinwalkers","color":"gray"}']}} 1
give @s minecraft:iron_sword{display:{Name:'{"text":"Self Defense","color":"gray","italic":false}'},Enchantments:[{id:"minecraft:knockback",lvl:1}]} 1

effect give @s minecraft:hero_of_the_village 999999 1 true

tellraw @s ["",{"text":"[OBJECTIVE]","color":"green"},{"text":" Complete all tasks to win"}]
tellraw @s ["",{"text":"[TIPS]","color":"yellow"},{"text":" Stick together and watch for suspicious behavior"}]
