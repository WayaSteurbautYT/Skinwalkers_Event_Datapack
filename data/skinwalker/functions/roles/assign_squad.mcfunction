# Assign roles for 4+ player mode (1 YouTuber, 1-2 Skinwalkers, rest are Survivors)
# This creates a balanced game with multiple roles and team dynamics

# Count players for role distribution
scoreboard players set #playerCount playerCount 0
execute as @a run scoreboard players add #playerCount playerCount 1

tellraw @a ["",{"text":"Starting ","color":"gray"},{"text":"Squad Mode","color":"yellow"},{"text":" (","color":"gray"},{"score":{"name":"#playerCount","objective":"playerCount"},"color":"yellow"},{"text":" players)","color":"gray"}]

# Assign YouTuber role to one random player
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
    tellraw @s ["",{"text":"• ","color":"blue"},{"text":"Lead the ","color":"gray"},{"text":"Survivors","color":"green"},{"text":" to victory","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"blue"},{"text":"Use ","color":"gray"},{"text":"Emergency Teleport","color":"dark_purple"},{"text":" to escape danger","color":"gray"}]
}

# Assign first Skinwalker
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
    tellraw @s ["",{"text":"• ","color":"red"},{"text":"Use ","color":"gray"},{"text":"Disguise Kit","color":"yellow"},{"text":" to blend in","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"red"},{"text":"Use ","color":"gray"},{"text":"right-click","color":"yellow"},{"text":" with items to use abilities","color":"gray"}]
}

# For 5+ players, add a second Skinwalker
execute if score #playerCount playerCount matches 5.. as @a[tag=!youtuber,tag=!skinwalker,sort=random,limit=1] run {
    tag @s add skinwalker
    scoreboard players set @s skinwalker.role 1
    
    # Give them Skinwalker items
    give @s minecraft:netherite_sword{display:{Name:'{"text":"Skinwalker Claws","color":"red","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:5},{id:"minecraft:unbreaking",lvl:3}],CustomModelData:1003} 1
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1004} 1
    give @s minecraft:player_head{display:{Name:'{"text":"Disguise Kit","color":"yellow","italic":false}'},HideFlags:32,SkullOwner:{Id:[I;0,0,0,0],Properties:{textures:[{Value:""}]}},CustomModelData:1005} 1
    
    # Notify them of their role
    tellraw @s ["",{"text":"\nYou are the ","color":"gray"},{"text":"Second Skinwalker","color":"dark_red","bold":true}]
    tellraw @s ["",{"text":"• ","color":"dark_red"},{"text":"Work with your ","color":"gray"},{"text":"ally","color":"red"},{"text":" to eliminate others","color":"gray"}]
}

# All remaining players become Survivors
execute as @a[tag=!youtuber,tag=!skinwalker] run {
    tag @s add survivor
    scoreboard players set @s skinwalker.role 2
    
    # Give them Survivor items
    give @s minecraft:iron_sword{display:{Name:'{"text":"Survivor's Blade","color":"white","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:2},{id:"minecraft:unbreaking",lvl:2}],CustomModelData:1006} 1
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
    give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
    
    # Notify them of their role
    tellraw @s ["",{"text":"\nYou are a ","color":"gray"},{"text":"Survivor","color":"green","bold":true}]
    tellraw @s ["",{"text":"• ","color":"green"},{"text":"Work with ","color":"gray"},{"text":"allies","color":"green"},{"text":" to complete tasks","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"green"},{"text":"Protect the ","color":"gray"},{"text":"YouTuber","color":"blue"},{"text":" at all costs!","color":"gray"}]
    tellraw @s ["",{"text":"• ","color":"green"},{"text":"Beware of ","color":"gray"},{"text":"Skinwalkers","color":"red"},{"text":" among you","color":"gray"}]
}

# Play role assignment sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0
