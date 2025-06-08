# Assign player as Skinwalker
scoreboard players set @s skinwalker.role 1
team join Skinwalker @s

# Initialize cooldowns
scoreboard players set @s skinwalker.claws_cooldown 0
scoreboard players set @s skinwalker.phase_cooldown 0
scoreboard players set @s skinwalker.disguise_cooldown 0

# Set cooldown times (in ticks, 20 ticks = 1 second)
scoreboard players set @s skinwalker.claws_cooldown_max 100  # 5 seconds
scoreboard players set @s skinwalker.phase_cooldown_max 200    # 10 seconds
scoreboard players set @s skinwalker.disguise_cooldown_max 300 # 15 seconds

title @s title ["",{"text":"YOU ARE THE SKINWALKER","color":"dark_red","bold":true}]
title @s subtitle ["",{"text":"Blend in and eliminate the survivors","color":"red"}]

effect give @s minecraft:invisibility 1 0 true
effect give @s minecraft:night_vision 999999 0 true

tellraw @s ["",{"text":"[OBJECTIVE]","color":"red"},{"text":" Eliminate all survivors before they complete their tasks"}]
tellraw @s ["",{"text":"[ABILITIES]","color":"red"},{"text":" Right-click with an ability item to use it"}]
tellraw @s ["",{"text":"[TIPS]","color":"gold"},{"text":" Use your abilities strategically and don't reveal your identity too soon!"}]

# Give abilities with proper NBT data
give @s minecraft:stick{display:{Name:'{"text":"Skinwalker Claws","color":"dark_red","italic":false}',Lore:['{"text":"Right-click to slash at nearby survivors","color":"gray"}','{"text":"Cooldown: 5s","color":"gray"}']},CustomModelData:1001,Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1} 1
give @s minecraft:feather{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to teleport forward","color":"gray"}','{"text":"Cooldown: 10s","color":"gray"}']},CustomModelData:1002,HideFlags:1} 1
give @s minecraft:player_head{display:{Name:'{"text":"Disguise","color":"dark_aqua","italic":false}',Lore:['{"text":"Right-click to copy a survivor's appearance","color":"gray"}','{"text":"Cooldown: 15s","color":"gray"}']},SkullOwner:"MHF_Question",CustomModelData:1003,HideFlags:1} 1

# Make skinwalkers glow to admins
data merge entity @s {Glowing:1b}

tag @s add skinwalker
