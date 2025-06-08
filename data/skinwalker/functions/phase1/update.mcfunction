# Phase 1: Survival - Per-tick updates

# Check for task completion every second (20 ticks)
scoreboard players add #task_check_timer skinwalker.temp 1
scoreboard players set #task_check_delay skinwalker.temp 20
execute if score #task_check_timer skinwalker.temp >= #task_check_delay skinwalker.temp run {
    scoreboard players set #task_check_timer skinwalker.temp 0
    
    # Check if all tasks are completed
    execute store result score #completed_tasks skinwalker.temp run scoreboard players get #tasks_completed skinwalker.tasks_completed
    execute store result score #total_tasks_needed skinwalker.temp run scoreboard players get #total_tasks skinwalker.tasks_total
    
    # If all tasks are completed, advance to next phase
    # Assuming #completed_tasks and #total_tasks_needed are correctly updated by the task system.
    # The task system needs to ensure #completed_tasks reflects the total number of *all* required tasks.
    execute if score #completed_tasks skinwalker.temp >= #total_tasks_needed skinwalker.temp run {
        tellraw @a ["",{"text":"=== ","color":"gold"},{"text":"ALL TASKS COMPLETED!","color":"green","bold":true},{"text":" ===","color":"gold"}]
        tellraw @a ["",{"text":"• ","color":"green"},{"text":"All tasks have been completed! Advancing to the next phase...","color":"white"}]
        
        # Advance to the next phase using the central phase advancement function
        function skinwalker:phase/advance_phase
    }
}

# Update bossbar with time remaining
scoreboard players operation #time_remaining skinwalker.temp = #phase1_duration skinwalker.temp
scoreboard players operation #time_remaining skinwalker.temp -= #phase_timer skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp = #time_remaining skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp /= 20 skinwalker.temp

# Update actionbar with time remaining
execute if score #time_remaining_seconds skinwalker.temp > 0 run title @a actionbar ["",{"text":"Phase 1: ","color":"green"},{"text":"Survival ","color":"white"},{"text":"• ","color":"gray"},{"text":"Time Left: ","color":"white"},{"score":{"name":"#time_remaining_seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":"s","color":"white"}]

# Play warning sound when 30 seconds remain
scoreboard players set #warning_time skinwalker.temp 600  # 30 seconds * 20 ticks
execute if score #time_remaining skinwalker.temp = #warning_time skinwalker.temp run {
    title @a title ["",{"text":"30 SECONDS REMAINING!","color":"red","bold":true}]
    playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5
}

# Check for player deaths and handle respawns
execute as @a[gamemode=spectator] at @s run function skinwalker:game/handle_respawn
