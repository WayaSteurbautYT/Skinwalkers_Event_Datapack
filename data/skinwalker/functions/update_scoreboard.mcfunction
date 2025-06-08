# Update the sidebar scoreboard for all players

# Clear existing scores
scoreboard objectives remove skinwalker.sidebar
scoreboard objectives add skinwalker.sidebar dummy

# Set display name
scoreboard objectives modify skinwalker.sidebar displayname [{"text":"☠ ","color":"dark_red"},{"text":"Skinwalker","color":"red","bold":true}]

# Add game phase info
scoreboard players set #phase_title skinwalker.sidebar 99
execute store result score #phase_value skinwalker.sidebar run scoreboard players get #game_phase skinwalker.phase
execute if score #game_phase skinwalker.phase matches 1 run scoreboard players set #phase_display skinwalker.sidebar "Phase 1: Tasks"
execute if score #game_phase skinwalker.phase matches 2 run scoreboard players set #phase_display skinwalker.sidebar "Phase 2: Showdown"
execute if score #game_phase skinwalker.phase matches 0 run scoreboard players set #phase_display skinwalker.sidebar "Waiting..."

# Add player counts
scoreboard players set #survivors_title skinwalker.sidebar 90
scoreboard players set #survivors_value skinwalker.sidebar 0
execute store result score #survivors_value skinwalker.sidebar run team list survivors

scoreboard players set #skinwalkers_title skinwalker.sidebar 80
scoreboard players set #skinwalkers_value skinwalker.sidebar 0
execute store result score #skinwalkers_value skinwalker.sidebar run team list skinwalkers

# Add task progress if in phase 1
execute if score #game_phase skinwalker.phase matches 1 as @a[tag=survivor] run {
    scoreboard players set #tasks_title skinwalker.sidebar 70
    scoreboard players set #tasks_completed skinwalker.sidebar 0
    
    # Count completed tasks
    execute if score @s skinwalker.task_mine_ores matches 1.. run scoreboard players add #tasks_completed skinwalker.sidebar 1
    execute if score @s skinwalker.task_craft_items matches 1.. run scoreboard players add #tasks_completed skinwalker.sidebar 1
    execute if score @s skinwalker.task_kill_mobs matches 1.. run scoreboard players add #tasks_completed skinwalker.sidebar 1
    execute if score @s skinwalker.task_travel_distance matches 100.. run scoreboard players add #tasks_completed skinwalker.sidebar 1
    execute if score @s skinwalker.task_build_structure matches 1.. run scoreboard players add #tasks_completed skinwalker.sidebar 1
    
    scoreboard players set #tasks_display skinwalker.sidebar 0
    execute store result score #tasks_display skinwalker.sidebar run scoreboard players get #tasks_completed skinwalker.sidebar
}

# Add time remaining if in phase 2
execute if score #game_phase skinwalker.phase matches 2 run {
    scoreboard players set #time_title skinwalker.sidebar 70
    scoreboard players set #time_value skinwalker.sidebar 0
    execute store result score #time_value skinwalker.sidebar run scoreboard players get #phase2_timer skinwalker.temp
    
    # Convert ticks to minutes:seconds
    scoreboard players operation #time_seconds skinwalker.temp = #time_value skinwalker.sidebar
    scoreboard players operation #time_seconds skinwalker.temp /= 20 skinwalker.temp
    scoreboard players operation #time_minutes skinwalker.temp = #time_seconds skinwalker.temp
    scoreboard players operation #time_minutes skinwalker.temp /= 60 skinwalker.temp
    scoreboard players operation #time_seconds skinwalker.temp %= 60 skinwalker.temp
    
    # Format as MM:SS
    scoreboard players set #time_display skinwalker.sidebar 0
    execute if score #time_minutes skinwalker.temp matches 1..9 store result score #time_display skinwalker.sidebar run scoreboard players get #time_minutes skinwalker.temp
    execute if score #time_seconds skinwalker.temp matches 10.. store result score #time_display skinwalker.sidebar run scoreboard players get #time_seconds skinwalker.temp
    execute if score #time_seconds skinwalker.temp matches ..9 store result score #time_display skinwalker.sidebar run scoreboard players get #time_seconds skinwalker.temp
}

# Set display order
scoreboard objectives setdisplay sidebar skinwalker.sidebar
