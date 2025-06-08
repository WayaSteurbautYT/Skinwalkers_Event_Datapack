# Check if we should transition to the next phase
# This runs every second from the main game loop

# Check if we're in an active game
execute unless score #game_active skinwalker.temp matches 1 run return 0

# Get current phase
scoreboard players get #phase skinwalker.phase

# Phase 1: Check if all tasks are completed or time is up
execute if score #phase skinwalker.phase matches 1 run {
    # Check if all tasks are completed
    execute if score #tasks_completed skinwalker.temp >= #total_tasks skinwalker.temp run {
        # All tasks completed - transition to phase 2
        function skinwalker:phase/advance_phase
        return 0
    }
    
    # Check if phase 1 time limit reached (10 minutes = 12000 ticks)
    execute if score #phase_timer skinwalker.temp >= 12000 run {
        # Time's up - transition to phase 2
        function skinwalker:phase/advance_phase
        return 0
    }
}

# Phase 2: Check if time is up or all skinwalkers are dead
execute if score #phase skinwalker.phase matches 2 run {
    # Check if phase 2 time limit reached (5 minutes = 6000 ticks)
    execute if score #phase_timer skinwalker.temp >= 6000 run {
        # Time's up - transition to phase 3
        function skinwalker:phase/advance_phase
        return 0
    }
    
    # Check if all skinwalkers are dead
    execute unless entity @a[tag=skinwalker] run {
        # All skinwalkers dead - survivors win
        function skinwalker:game/end_survivors_win
        return 0
    }
    
    # Check if all survivors are dead
    execute unless entity @a[tag=survivor] run {
        # All survivors dead - skinwalkers win
        function skinwalker:game/end_skinwalkers_win
        return 0
    }
}

# Phase 3: Check if time is up or win conditions are met
execute if score #phase skinwalker.phase matches 3 run {
    # Check if phase 3 time limit reached (2 minutes = 2400 ticks)
    execute if score #phase_timer skinwalker.temp >= 2400 run {
        # Time's up - check win conditions
        execute if entity @a[tag=skinwalker] if entity @a[tag=survivor] run {
            # Both teams still alive - sudden death
            function skinwalker:game/end_sudden_death
        } else execute if entity @a[tag=skinwalker] run {
            # Skinwalkers win
            function skinwalker:game/end_skinwalkers_win
        } else execute if entity @a[tag=survivor] run {
            # Survivors win
            function skinwalker:game/end_survivors_win
        }
        return 0
    }
    
    # Check if all skinwalkers are dead
    execute unless entity @a[tag=skinwalker] run {
        # All skinwalkers dead - survivors win
        function skinwalker:game/end_survivors_win
        return 0
    }
    
    # Check if all survivors are dead
    execute unless entity @a[tag=survivor] run {
        # All survivors dead - skinwalkers win
        function skinwalker:game/end_skinwalkers_win
        return 0
    }
}

# Update phase timer
scoreboard players add #phase_timer skinwalker.temp 1

# Update bossbar with time remaining
execute if score #phase skinwalker.phase matches 1 run {
    # Phase 1: Show time until phase 2 (10 minutes total)
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 12000 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    
    # Convert ticks to seconds
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Update bossbar
    bossbar set skinwalker:time value 0
    bossbar set skinwalker:time max 600
    execute store result bossbar skinwalker:time value run scoreboard players get #time_remaining skinwalker.temp
    
    # Update bossbar name with time remaining
    bossbar set skinwalker:time name ["",{"text":"Time until Phase 2: ","color":"green"},{"score":{"name":"#time_remaining","objective":"skinwalker.temp"},"color":"white"},{"text":"s","color":"green"}]
}

execute if score #phase skinwalker.phase matches 2 run {
    # Phase 2: Show time until phase 3 (5 minutes total)
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 6000 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    
    # Convert ticks to seconds
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Update bossbar
    bossbar set skinwalker:time value 0
    bossbar set skinwalker:time max 300
    execute store result bossbar skinwalker:time value run scoreboard players get #time_remaining skinwalker.temp
    
    # Update bossbar name with time remaining
    bossbar set skinwalker:time name ["",{"text":"Time until Phase 3: ","color":"red"},{"score":{"name":"#time_remaining","objective":"skinwalker.temp"},"color":"white"},{"text":"s","color":"red"}]
}

execute if score #phase skinwalker.phase matches 3 run {
    # Phase 3: Show time until game end (2 minutes total)
    scoreboard players operation #time_remaining skinwalker.temp = #phase_timer skinwalker.temp
    scoreboard players operation #time_remaining skinwalker.temp -= 2400 const
    scoreboard players operation #time_remaining skinwalker.temp *= -1 const
    
    # Convert ticks to seconds
    scoreboard players operation #time_remaining skinwalker.temp /= 20 const
    
    # Update bossbar
    bossbar set skinwalker:time value 0
    bossbar set skinwalker:time max 120
    execute store result bossbar skinwalker:time value run scoreboard players get #time_remaining skinwalker.temp
    
    # Update bossbar name with time remaining
    bossbar set skinwalker:time name ["",{"text":"Time remaining: ","color":"dark_red"},{"score":{"name":"#time_remaining","objective":"skinwalker.temp"},"color":"white"},{"text":"s","color":"dark_red"}]
}
