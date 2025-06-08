# Main game loop - runs every tick

# Handle player joins (every 10 ticks to reduce lag)
scoreboard players add #join_timer skinwalker.temp 1
execute if score #join_timer skinwalker.temp matches 10.. run {
    scoreboard players set #join_timer skinwalker.temp 0
    execute as @a[tag=!joined] run function skinwalker:events/on_player_join
}

# Handle player deaths
execute as @e[type=player,tag=!death_handled,nbt={DeathTime:1s}] run function skinwalker:events/on_player_death

# Handle player respawns
execute as @a[gamemode=!spectator] at @s if entity @s[gamemode=!spectator] run function skinwalker:events/on_player_respawn

# Handle disguise selection
execute as @a[scores={skinwalker.disguise_select=1..}] run {
    # Store the selected index
    scoreboard players operation #selected_index skinwalker.temp = @s skinwalker.disguise_select
    # Reset the trigger
    scoreboard players set @s skinwalker.disguise_select 0
    # Handle the selection
    function skinwalker:items/handle_disguise_select
}

# Handle disguise cancellation
execute as @a[scores={skinwalker.disguise_cancel=1..}] run {
    # Reset the trigger
    scoreboard players set @s skinwalker.disguise_cancel 0
    # Handle the cancellation
    function skinwalker:items/handle_disguise_cancel
}

# Only run game logic if game is in progress
execute if score #game_phase skinwalker.phase matches 1..9 run {
    # Main game loop
    function skinwalker:game_loop
    
    # Handle abilities
    function skinwalker:abilities/handle_abilities
    
    # Check for completed tasks
    function skinwalker:tasks/check_tasks
    
    # Update action bars for survivors
    execute as @a[tag=survivor] run function skinwalker:tasks/update_task_list
    
    # Handle cooldowns
    scoreboard players remove @a[scores={skinwalker.cooldown=1..}] skinwalker.cooldown 1
    scoreboard players remove @a[scores={skinwalker.ability_cooldown=1..}] skinwalker.ability_cooldown 1
    scoreboard players remove @a[scores={skinwalker.ability_duration=1..}] skinwalker.ability_duration 1
    
    # Check for emergency beacon use
    execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Emergency Beacon"}}}}] run function skinwalker:items/emergency_beacon
    
    # Check for task tracker use
    execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Task Tracker"}}}}] run function skinwalker:items/task_tracker
    
    # Check for disguise selector use
    execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Disguise Selector"}}}}] run function skinwalker:items/disguise_selector

    # Check disguise timers
    execute if score #game_tick skinwalker.temp matches 20..20 run {
        # Reset the tick counter
        scoreboard players set #game_tick skinwalker.temp 0
        
        # Check disguise timers for all disguised players
        execute as @a[tag=disguised] run function skinwalker:abilities/disguise/check_disguise_timer
    }
    
    # Increment the game tick counter
    scoreboard players add #game_tick skinwalker.temp 1
    
    # Update scoreboard display
    execute if score #scoreboard_timer skinwalker.temp matches 20.. run {
        scoreboard players set #scoreboard_timer skinwalker.temp 0
        scoreboard objectives setdisplay sidebar skinwalker.sidebar
    }
    scoreboard players add #scoreboard_timer skinwalker.temp 1
}
