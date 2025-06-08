# Update the scoreboard sidebar with game information

# Clear existing sidebar
scoreboard objectives setdisplay sidebar

# Create or update the sidebar objective
scoreboard objectives remove skinwalker.sidebar
execute store result score #dummy skinwalker.temp run scoreboard objectives add skinwalker.sidebar dummy {"text":"Skinwalker Event","color":"dark_red"}

# Set the display name
scoreboard objectives modify skinwalker.sidebar displayname ["",{"text":"=== ","color":"dark_red"},{"text":"SKINWALKER EVENT","color":"red","bold":true},{"text":" ===","color":"dark_red"}]

# Add phase information
scoreboard players set #phase_info skinwalker.sidebar 0
scoreboard players set #phase_info skinwalker.sidebar 0

# Add blank line
scoreboard players set #blank1 skinwalker.sidebar 0

# Add player counts
execute store result score #survivor_count skinwalker.sidebar run tag @a[tag=survivor] list
execute store result score #skinwalker_count skinwalker.sidebar run tag @a[tag=skinwalker] list

# Add phase-specific information
execute if score #phase skinwalker.phase matches 1 run {
    # Phase 1: Show tasks progress
    scoreboard players set #tasks_label skinwalker.sidebar 0
    
    # Calculate time remaining in phase 1 (10 minutes = 12000 ticks)
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 12000 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Add time remaining
    scoreboard players set #time_label skinwalker.sidebar 0
    execute store result score #time_remaining_display skinwalker.sidebar run scoreboard players get #time_remaining skinwalker.temp
}

execute if score #phase skinwalker.phase matches 2 run {
    # Phase 2: Show time until phase 3
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 6000 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Add time remaining
    scoreboard players set #phase2_time_label skinwalker.sidebar 0
    execute store result score #time_remaining_display skinwalker.sidebar run scoreboard players get #time_remaining skinwalker.temp
}

execute if score #phase skinwalker.phase matches 3 run {
    # Phase 3: Show time until game end
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 2400 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Add time remaining
    scoreboard players set #phase3_time_label skinwalker.sidebar 0
    execute store result score #time_remaining_display skinwalker.sidebar run scoreboard players get #time_remaining skinwalker.temp
}

# Add blank line
scoreboard players set #blank2 skinwalker.sidebar 0

# Add player list header
scoreboard players set #players_header skinwalker.sidebar 0

# Add players with their roles
# This is handled by a separate function to avoid command length limits
function skinwalker:gui/update_player_list

# Show the sidebar
scoreboard objectives setdisplay sidebar skinwalker.sidebar
