# Check all survivors' task progress and handle completion
# This runs periodically during the game

# Only check during Phase 1
execute if score #game_phase skinwalker.phase matches 1 run {
    # Check each survivor's tasks
    execute as @a[tag=survivor] run function skinwalker:tasks/check_task_completion
    
    # Update task displays
    execute as @a[tag=survivor] run function skinwalker:tasks/update_task_list
    
    # Check if all survivors have completed their tasks
    scoreboard players set #survivors_completed skinwalker.temp 0
    scoreboard players set #total_survivors skinwalker.temp 0
    
    # Count survivors who have completed all tasks
    execute as @a[tag=survivor] run {
        scoreboard players add #total_survivors skinwalker.temp 1
        execute if score @s skinwalker.tasks matches 3.. run scoreboard players add #survivors_completed skinwalker.temp 1
    }
    
    # If all survivors have completed their tasks, advance to next phase
    execute if score #survivors_completed skinwalker.temp >= #total_survivors skinwalker.temp run {
        # Announce phase completion
        title @a title ["",{"text":"ALL SURVIVORS HAVE COMPLETED THEIR TASKS!","color":"green","bold":true}]
        title @a subtitle ["",{"text":"Preparing for Phase 2...","color":"white"}]
        playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
        
        # Set phase transition cooldown
        scoreboard players set #phase_transition_timer skinwalker.temp 100
        
        # Schedule phase transition
        schedule function skinwalker:phase2_setup 3s
    }
}

# If in Phase 2, check for win condition
execute if score #game_phase skinwalker.phase matches 2 run {
    # Check if all skinwalkers are dead
    execute unless entity @a[tag=skinwalker] run {
        # Survivors win
        function skinwalker:game/end_survivors_win
    }
    
    # Check if all survivors are dead or transformed
    execute unless entity @a[tag=survivor] run {
        # Skinwalkers win
        function skinwalker:game/end_skinwalkers_win
    }
}
