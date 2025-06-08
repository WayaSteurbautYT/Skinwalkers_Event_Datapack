# Phase 2: Final Showdown Loop

# Check win conditions
scoreboard players set #survivors_alive skinwalker.temp 0
scoreboard players set #skinwalkers_alive skinwalker.temp 0

# Count survivors and skinwalkers
execute as @a[tag=survivor] run scoreboard players add #survivors_alive skinwalker.temp 1
execute as @a[tag=skinwalker] run scoreboard players add #skinwalkers_alive skinwalker.temp 1

# Check if all skinwalkers are dead
execute if score #skinwalkers_alive skinwalker.temp matches 0 run {
    # Survivors win
    function skinwalker:game/end_survivors_win
    return 0
}

# Check if all survivors are dead
execute if score #survivors_alive skinwalker.temp matches 0 run {
    # Skinwalkers win
    function skinwalker:game/end_skinwalkers_win
    return 0
}

# Show action bar updates
execute if score #phase2_timer skinwalker.temp matches ..0 run {
    # Update action bar every second
    scoreboard players set #phase2_timer skinwalker.temp 20
    
    # Show remaining players
    execute as @a[tag=survivor] run {
        title @s actionbar [
            "",
            {"text":"Survivors: ","color":"green"},
            {"score":{"name":"#survivors_alive","objective":"skinwalker.temp"},"color":"white"},
            {"text":" ","color":"gray"},
            {"text":"Skinwalkers: ","color":"red"},
            {"score":{"name":"#skinwalkers_alive","objective":"skinwalker.temp"},"color":"white"}
        ]
    }
    
    execute as @a[tag=skinwalker] run {
        title @s actionbar [
            "",
            {"text":"Survivors: ","color":"green"},
            {"score":{"name":"#survivors_alive","objective":"skinwalker.temp"},"color":"white"},
            {"text":" ","color":"gray"},
            {"text":"Skinwalkers: ","color":"red"},
            {"score":{"name":"#skinwalkers_alive","objective":"skinwalker.temp"},"color":"white"}
        ]
    }
}

# Decrement timers
scoreboard players remove #phase2_timer skinwalker.temp 1

# Schedule next loop if still in phase 2
execute if score #game_phase skinwalker.phase matches 2 run schedule function skinwalker:phase2_loop 1t
