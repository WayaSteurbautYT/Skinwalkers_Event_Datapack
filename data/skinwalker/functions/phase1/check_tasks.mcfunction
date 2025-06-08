# Function: skinwalker:phase1/check_tasks
# Purpose: Check if players have completed their tasks during Phase 1
# Runs every 10 seconds during Phase 1

# Only run if we're in Phase 1
execute unless score #phase skinwalker.phase matches 1 run return 0

# Check task completion for each survivor
execute as @a[team=Survivor] run function skinwalker:tasks/check_task_completion

# Count how many survivors have completed all their tasks
scoreboard players set #completed_survivors skinwalker.temp 0
scoreboard players set #total_survivors skinwalker.temp 0

execute as @a[team=Survivor] run {
    # Increment total survivors
    scoreboard players add #total_survivors skinwalker.temp 1
    
    # Check if this survivor has completed all tasks (3 tasks)
    execute if score @s skinwalker.tasks matches 3.. run {
        scoreboard players add #completed_survivors skinwalker.temp 1
        
        # Check if we need to notify this player
        execute unless score @s skinwalker.notified_tasks_complete matches 1 run {
            tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"You have completed all your tasks! ","color":"white"},{"text":"Wait for others to finish.","color":"gray"}]
            scoreboard players set @s skinwalker.notified_tasks_complete 1
        }
    }
}

# Calculate remaining survivors who haven't completed tasks
scoreboard players operation #remaining_survivors skinwalker.temp = #total_survivors skinwalker.temp
scoreboard players operation #remaining_survivors skinwalker.temp -= #completed_survivors skinwalker.temp

# If all survivors have completed their tasks
execute if score #remaining_survivors skinwalker.temp matches 0 run {
    # Notify all players
    title @a title ["",{"text":"All tasks completed!","color":"green"}]
    playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
    
    # Small delay before starting phase 2
    schedule function skinwalker:phase2/start 3s
    
    # Clear the scheduled task
    schedule clear skinwalker:phase1/check_tasks
    return 0
}

# Show progress to all players (only if there are survivors with incomplete tasks)
execute if score #remaining_survivors skinwalker.temp matches 1.. run {
    # Only show progress message every 30 seconds to reduce spam
    scoreboard players add #task_check_counter skinwalker.temp 1
    execute if score #task_check_counter skinwalker.temp matches 3.. run {
        scoreboard players set #task_check_counter skinwalker.temp 0
        title @a actionbar ["",{"text":"Task Progress: ","color":"gray"},
            {"score":{"name":"#completed_survivors","objective":"skinwalker.temp"},"color":"green"},
            {"text":"/","color":"gray"},
            {"score":{"name":"#total_survivors","objective":"skinwalker.temp"},"color":"green"},
            {"text":" survivors completed tasks","color":"gray"}
        ]
    }
}

# Reschedule check
schedule function skinwalker:phase1/check_tasks 10s replace
