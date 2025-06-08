# Phase Loop - Handles phase progression and timing

# Increment phase timer
scoreboard players add #phase_timer skinwalker.temp 1

# Phase 1: Task Completion Check
scoreboard players add #task_check_timer skinwalker.temp 1
execute if score #phase skinwalker.phase matches 1 if score #task_check_timer skinwalker.temp matches 60.. run {
    scoreboard players set #task_check_timer skinwalker.temp 0
    
    # Check all survivors' task progress
    execute as @a[tag=survivor] run {
        function skinwalker:tasks/check_task_completion
        function skinwalker:tasks/update_task_list
    }
    
    # Count survivors who completed tasks
    execute store result score #survivors_completed skinwalker.temp run execute as @a[tag=survivor,scores={skinwalker.tasks=3..}] run scoreboard players add #survivors_completed skinwalker.temp 1
    execute store result score #total_survivors skinwalker.temp run execute as @a[tag=survivor] run scoreboard players add #total_survivors skinwalker.temp 1
    
    # If all survivors completed tasks, start phase transition
    execute if score #survivors_completed skinwalker.temp >= #total_survivors skinwalker.temp run {
        execute unless score #phase_transition_timer skinwalker.temp matches 1.. run {
            scoreboard players set #phase_transition_timer skinwalker.temp 100
            title @a title ["",{"text":"PHASE 1 COMPLETE!","color":"gold"}]
            title @a subtitle ["",{"text":"Preparing for Phase 2...","color":"yellow"}]
            playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0
        }
    }
}

# Phase 2: Time-based transition to Phase 3
execute if score #phase skinwalker.phase matches 2 if score #phase_timer skinwalker.temp >= 3600 run {
    # 3 minutes (3600 ticks) in Phase 2, move to Phase 3
    function skinwalker:phase/advance_phase
}

# Phase 3: Final Countdown
execute if score #phase skinwalker.phase matches 3 if score #phase_timer skinwalker.temp >= 2400 run {
    # 2 minutes (2400 ticks) in Phase 3, end game
    function skinwalker:end_game
}

# Handle phase transitions
execute if score #phase_transition_timer skinwalker.temp matches 1.. run {
    scoreboard players remove #phase_transition_timer skinwalker.temp 1
    execute if score #phase_transition_timer skinwalker.phase matches 0 run {
        function skinwalker:phase/advance_phase
    }
}
