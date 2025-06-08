# Phase 1 Loop - Handles task progression and disguise mechanics

# Increment phase timer
scoreboard players add #phase_timer skinwalker.temp 1

# Check for task completion every 3 seconds (60 ticks)
scoreboard players add #task_check_timer skinwalker.temp 1
execute if score #task_check_timer skinwalker.temp matches 60.. run {
    scoreboard players set #task_check_timer skinwalker.temp 0
    
    # Check all survivors' task progress
    execute as @a[tag=survivor] run {
        function skinwalker:tasks/check_task_completion
        function skinwalker:tasks/update_task_list
    }
    
    # Check if all survivors have completed their tasks
    execute store result score #survivors_completed skinwalker.temp run execute as @a[tag=survivor,scores={skinwalker.tasks=3..}] run scoreboard players add #survivors_completed skinwalker.temp 1
    execute store result score #total_survivors skinwalker.temp run execute as @a[tag=survivor] run scoreboard players add #total_survivors skinwalker.temp 1
    
    # If all survivors have completed their tasks, prepare for phase 2
    execute if score #survivors_completed skinwalker.temp >= #total_survivors skinwalker.temp run {
        # Set transition timer if not already set
        execute unless score #phase_transition_timer skinwalker.temp matches 1.. run scoreboard players set #phase_transition_timer skinwalker.temp 100
    }
}

# Handle phase transition
execute if score #phase_transition_timer skinwalker.temp matches 1.. run {
    # Decrement timer
    scoreboard players remove #phase_transition_timer skinwalker.temp 1
    
    # Show countdown in title
    execute if score #phase_transition_timer skinwalker.temp matches 100 run title @a title ["",{"text":"ALL TASKS COMPLETED!","color":"green","bold":true}]
    execute if score #phase_transition_timer skinwalker.temp matches 80 run title @a title ["",{"text":"PHASE 2 STARTING SOON!","color":"gold","bold":true}]
    execute if score #phase_transition_timer skinwalker.temp matches 60 run title @a title ["",{"text":"3","color":"red","bold":true}]
    execute if score #phase_transition_timer skinwalker.temp matches 40 run title @a title ["",{"text":"2","color":"yellow","bold":true}]
    execute if score #phase_transition_timer skinwalker.temp matches 20 run title @a title ["",{"text":"1","color":"green","bold":true}]
    
    # Play countdown sound
    execute if score #phase_transition_timer skinwalker.temp matches 60.. if score #phase_transition_timer skinwalker.temp matches ..60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
    
    # Transition to phase 2
    execute if score #phase_transition_timer skinwalker.temp matches 0 run {
        function skinwalker:phase2_setup
        scoreboard players set #game_phase skinwalker.phase 2
    }
}

# Handle disguised skinwalkers
execute as @a[tag=skinwalker,tag=disguised] run {
    # Check if disguised player is still online
    execute unless entity @a[name=!@s,name=@s[tag=disguised_as]] run {
        # Target player left, remove disguise
        function skinwalker:abilities/disguise/remove_disguise
        tellraw @s ["",{"text":"Your target left the game. Disguise removed!","color":"red"}]
    }
}

# Random YouTuber interaction (optional, can be disabled)
# execute as @a[tag=!skinwalker.interacted] run function skinwalker:youtubers/random_interaction

# Schedule next loop if still in phase 1
execute if score #game_phase skinwalker.phase matches 1 run schedule function skinwalker:phase1_loop 1t
