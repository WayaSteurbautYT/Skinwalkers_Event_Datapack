# Assign player as Survivor
scoreboard players set @s skinwalker.role 2
team join Survivor @s
title @s title ["",{"text":"YOU ARE A SURVIVOR","color":"green","bold":true}]
title @s subtitle ["",{"text":"Complete tasks and stay alive","color":"dark_green"}]

give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1}]} 1
give @s minecraft:clock{display:{Name:'{"text":"Emergency Beacon","color":"yellow","italic":false}',Lore:['{"text":"Right-click to reveal nearby Skinwalkers","color":"gray"}']}} 1

tellraw @s ["",{"text":"[OBJECTIVE]","color":"green"},{"text":" Complete all tasks before the Skinwalkers get you"}]
tellraw @s ["",{"text":"[TIPS]","color":"yellow"},{"text":" Stick together and watch for suspicious behavior"}]
