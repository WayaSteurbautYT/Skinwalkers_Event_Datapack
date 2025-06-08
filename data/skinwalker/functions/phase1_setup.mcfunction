# Phase 1: Initial Setup - Survival Phase

# Set game mode and clear inventories
gamemode adventure @a
gamerule doImmediateRespawn true
gamerule keepInventory false

# Clear all players
clear @a
kill @e[type=item]

# Assign teams and roles
execute as @a run {
    # Clear existing tags
    tag @s remove survivor
    tag @s remove skinwalker
    tag @s remove youtuber
    
    # Assign random skinwalker (1 in 5 chance)
    execute if score #random 1 matches 1 run {
        tag @s add skinwalker
        team join skinwalkers @s
        function skinwalker:give_skinwalker_abilities
        function skinwalker:skin/set_skinwalker
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are a ","color":"red"},{"text":"Skinwalker!","color":"dark_red","bold":true}]
        tellraw @s ["",{"text":"Disguise yourself as survivors and eliminate them!","color":"red"}]
    } else {
        # Assign as survivor
        tag @s add survivor
        team join survivors @s
        function skinwalker:give_survivor_items
        tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"i","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"You are a ","color":"white"},{"text":"Survivor!","color":"green","bold":true}]
        tellraw @s ["",{"text":"Complete your tasks and survive the night!","color":"white"}]
        
        # Assign random tasks
        function skinwalker:tasks/assign_tasks
    }
}

# Initial game announcements
title @a title ["",{"text":"THE GAME BEGINS","color":"gold","bold":true}]
title @a subtitle ["",{"text":"Survivors: Complete your tasks | Skinwalkers: Stay hidden","color":"yellow"}]

# Play sound effect
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.8

# Start the main game loop
schedule function skinwalker:game_loop 3s
