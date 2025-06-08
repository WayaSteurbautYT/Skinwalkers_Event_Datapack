# Assign roles for 3-player mode (1 YouTuber, 1 Survivor, 1 Skinwalker)
# This creates a dynamic 3-way game where each role has different objectives

tellraw @a ["",{"text":"Starting ","color":"gray"},{"text":"3-Player Mode","color":"yellow"},{"text":" (1v1v1)","color":"gray"}]

# Assign YouTuber role
execute as @a[sort=random,limit=1] run {
    tag @s add youtuber
    scoreboard players set @s skinwalker.role 3
    
    # Give them YouTuber items
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"blue","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
    give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Emergency Teleport","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1007} 2
    
    # Notify them of their role
    tellraw @s ["",{"text":"\nYou are a ","color":"gray"},{"text":"YouTuber","color":"blue","bold":true}]
    tellraw @s ["",{"text":"• ","color":"blue"},{"text":"Complete ","color":"gray"},{"text":"5 tasks","color":"green"},{"text":" to win","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"blue"},{"text":"Use ","color":"gray"},{"text":"Emergency Teleport","color":"dark_purple"},{"text":" to escape danger","color":"gray"}]
}

# Assign Skinwalker role
execute as @a[tag=!youtuber,sort=random,limit=1] run {
    tag @s add skinwalker
    scoreboard players set @s skinwalker.role 1
    
    # Give them Skinwalker items
    give @s minecraft:netherite_sword{display:{Name:'{"text":"Skinwalker Claws","color":"red","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:5},{id:"minecraft:unbreaking",lvl:3}],CustomModelData:1003} 1
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1004} 2
    give @s minecraft:player_head{display:{Name:'{"text":"Disguise Kit","color":"yellow","italic":false}'},HideFlags:32,SkullOwner:{Id:[I;0,0,0,0],Properties:{textures:[{Value:""}]}},CustomModelData:1005} 1
    
    # Notify them of their role
    tellraw @s ["",{"text":"\nYou are the ","color":"gray"},{"text":"Skinwalker","color":"red","bold":true}]
    tellraw @s ["",{"text":"• ","color":"red"},{"text":"Eliminate ","color":"gray"},{"text":"Survivors","color":"green"},{"text":" and ","color":"gray"},{"text":"YouTubers","color":"blue"}]
    tellraw @s ["",{"text":"• ","color":"red"},{"text":"Use ","color":"gray"},{"text":"right-click","color":"yellow"},{"text":" with items to use abilities","color":"gray"}]
}

# The remaining player becomes the Survivor
execute as @a[tag=!youtuber,tag=!skinwalker] run {
    tag @s add survivor
    scoreboard players set @s skinwalker.role 2
    
    # Give them Survivor items
    give @s minecraft:iron_sword{display:{Name:'{"text":"Survivor's Blade","color":"white","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:2},{id:"minecraft:unbreaking",lvl:2}],CustomModelData:1006} 1
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
    give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
    
    # Notify them of their role
    tellraw @s ["",{"text":"\nYou are a ","color":"gray"},{"text":"Survivor","color":"green","bold":true}]
    tellraw @s ["",{"text":"• ","color":"green"},{"text":"Work with the ","color":"gray"},{"text":"YouTuber","color":"blue"},{"text":" to complete tasks","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"green"},{"text":"Beware of the ","color":"gray"},{"text":"Skinwalker","color":"red"}]
}

# Play role assignment sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0
