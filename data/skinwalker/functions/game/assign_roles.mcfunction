# Assign roles to all players at the start of the game

# Count total players
execute store result score #total_players skinwalker.temp run team list

# Calculate number of skinwalkers (1 for every 4 players, minimum 1)
scoreboard players set #skinwalker_count skinwalker.temp 1
scoreboard players operation #skinwalker_count skinwalker.temp = #total_players skinwalker.temp
scoreboard players operation #skinwalker_count skinwalker.temp /= 4 skinwalker.temp
scoreboard players set #min_skinwalkers skinwalker.temp 1
execute unless score #skinwalker_count skinwalker.temp >= #min_skinwalkers skinwalker.temp run scoreboard players set #skinwalker_count skinwalker.temp 1

# Shuffle players for random role assignment
scoreboard players set #assigned_skinwalkers skinwalker.temp 0

execute as @a[tag=joined] run {
    # Clear any existing roles
    tag @s remove skinwalker
    tag @s remove survivor
    
    # Assign skinwalker role if we haven't reached the limit
    execute if score #assigned_skinwalkers skinwalker.temp < #skinwalker_count skinwalker.temp run {
        # Assign as skinwalker
        tag @s add skinwalker
        team join skinwalkers @s
        
        # Give skinwalker items
        give @s minecraft:stick{display:{Name:'{"text":"Disguise Selector","color":"dark_red","italic":false}',Lore:['{"text":"Right-click to select a disguise","color":"gray","italic":false}']},CustomModelData:1000} 1
        give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to become intangible","color":"gray","italic":false}','{"text":"for 5 seconds (30s cooldown)","color":"dark_gray","italic":false}']},CustomModelData:1001} 1
        
        # Notify player
        title @s title ["",{"text":"YOU ARE A SKINWALKER","color":"red","bold":true}]
        title @s subtitle ["",{"text":"Disguise yourself and eliminate the survivors!","color":"white"}]
        
        # Play sound
        playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 1 0.5
        
        # Increment counter
        scoreboard players add #assigned_skinwalkers skinwalker.temp 1
    } else {
        # Assign as survivor
        tag @s add survivor
        team join survivors @s
        
        # Give survivor items
        give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:['{"text":"Right-click to view your tasks","color":"gray","italic":false}']},CustomModelData:2000} 1
        give @s minecraft:totem_of_undying{display:{Name:'{"text":"Emergency Beacon","color":"yellow","italic":false}',Lore:['{"text":"Reveals nearby Skinwalkers","color":"gray","italic":false}','{"text":"for 10 seconds (2m cooldown)","color":"dark_gray","italic":false}']},CustomModelData:2001} 1
        
        # Notify player
        title @s title ["",{"text":"YOU ARE A SURVIVOR","color":"green","bold":true}]
        title @s subtitle ["",{"text":"Complete tasks and identify the Skinwalkers!","color":"white"}]
        
        # Play sound
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Assign random tasks
        scoreboard players set @s skinwalker.task_mine_ores 0
        scoreboard players set @s skinwalker.task_craft_items 0
        scoreboard players set @s skinwalker.task_kill_mobs 0
        scoreboard players set @s skinwalker.task_travel_distance 0
        scoreboard players set @s skinwalker.task_build_structure 0
        
        # Assign 3 random tasks (1 = active, 0 = inactive)
        execute store result score @s skinwalker.task_mine_ores run scoreboard players get #random_task skinwalker.temp
        execute if score @s skinwalker.task_mine_ores matches 0..1 run scoreboard players set @s skinwalker.task_mine_ores 1
        
        execute store result score @s skinwalker.task_craft_items run scoreboard players get #random_task skinwalker.temp
        execute if score @s skinwalker.task_craft_items matches 0..1 run scoreboard players set @s skinwalker.task_craft_items 1
        
        execute store result score @s skinwalker.task_kill_mobs run scoreboard players get #random_task skinwalker.temp
        execute if score @s skinwalker.task_kill_mobs matches 0..1 run scoreboard players set @s skinwalker.task_kill_mobs 1
        
        # Make sure at least 3 tasks are assigned
        scoreboard players operation #task_count skinwalker.temp = @s skinwalker.task_mine_ores
        scoreboard players operation #task_count skinwalker.temp += @s skinwalker.task_craft_items
        scoreboard players operation #task_count skinwalker.temp += @s skinwalker.task_kill_mobs
        
        execute if score #task_count skinwalker.temp matches ..2 run {
            scoreboard players set @s skinwalker.task_travel_distance 1
            scoreboard players operation #task_count skinwalker.temp += 1
        }
        
        execute if score #task_count skinwalker.temp matches ..2 run {
            scoreboard players set @s skinwalker.task_build_structure 1
        }
    }
    
    # Set game mode to survival
    gamemode survival @s
    
    # Teleport to spawn
    spawnpoint @s ~ ~ ~
    teleport @s ~ ~ ~
}

# Broadcast role assignments
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Roles have been assigned! ","color":"white"},
{"text":"(","color":"gray"},{"score":{"name":"#skinwalker_count","objective":"skinwalker.temp"},"color":"red"},{"text":" ","color":"gray"},{"text":"Skinwalkers","color":"red"},{"text":")","color":"gray"}]

# Start the game loop
scoreboard players set #game_phase skinwalker.phase 1
function skinwalker:game/start_phase1
