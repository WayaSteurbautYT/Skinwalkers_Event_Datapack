# Convert a survivor to a Skinwalker
# This function is called when a survivor is infected by a Skinwalker's claws

# Store original team and role
execute store result storage skinwalker:playerdata {UUID: 0} Team string run data get entity @s Team
execute store result storage skinwalker:playerdata {UUID: 0} Role int 1 run scoreboard players get @s skinwalker.role

# Change team and role
team leave @s
team join Skinwalker @s
scoreboard players set @s skinwalker.role 1

# Give Skinwalker abilities
give @s minecraft:stick{display:{Name:'{"text":"Skinwalker Claws","color":"dark_red","italic":false}',Lore:['{"text":"Right-click to slash at nearby survivors","color":"gray"}','{"text":"Chance to infect survivors","color":"red"}','{"text":"Cooldown: 5s","color":"gray"}']},CustomModelData:1001,Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1} 1
give @s minecraft:feather{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to teleport forward","color":"gray"}','{"text":"Cooldown: 10s","color":"gray"}']},CustomModelData:1002,HideFlags:1} 1
give @s minecraft:player_head{display:{Name:'{"text":"Disguise","color":"dark_aqua","italic":false}',Lore:['{"text":"Right-click to copy a survivor's appearance","color":"gray"}','{"text":"Cooldown: 15s","color":"gray"}']},SkullOwner:"MHF_Question",CustomModelData:1003,HideFlags:1} 1

# Remove survivor items
clear @s minecraft:compass
clear @s minecraft:clock

# Apply effects
effect give @s minecraft:invisibility 1 0 true
effect give @s minecraft:night_vision 999999 0 true
effect give @s minecraft:glowing 10 0 true

# Add skinwalker tag
scoreboard players set @s skinwalker.role 1
tag @s add skinwalker
tag @s remove survivor

# Play transformation effects
particle minecraft:witch ~ ~1 ~ 0.5 2 0.5 0.1 100
particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 30
playsound minecraft:entity.evoker.prepare_wololo player @a ~ ~ ~ 1 1
playsound minecraft:entity.ender_dragon.growl player @a ~ ~ ~ 1 0.5

# Notify the converted player
title @s title ["",{"text":"YOU'VE BEEN INFECTED!","color":"dark_red","bold":true}]
title @s subtitle ["",{"text":"You are now a Skinwalker!","color":"red"}]
tellraw @s ["\n",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Your goal is now to ","color":"red"},{"text":"eliminate all survivors","color":"dark_red","bold":true},{"text":"!","color":"red"}]
tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"ABILITIES","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You have gained new abilities to help you hunt!","color":"red"}]

# Update player lists and scoreboards
scoreboard players add #skinwalkers_alive skinwalker.temp 1
scoreboard players remove #survivors_alive skinwalker.temp 1

# Clear temporary storage
data remove storage skinwalker:playerdata {UUID: 0} Team
data remove storage skinwalker:playerdata {UUID: 0} Role
