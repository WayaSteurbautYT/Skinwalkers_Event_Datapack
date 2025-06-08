# Main game loop - Runs every tick

# Update phase system
function skinwalker:phase/loop

# Update phase-specific logic
execute if score #phase skinwalker.phase matches 1 run function skinwalker:phase1_loop
execute if score #phase skinwalker.phase matches 2 run function skinwalker:phase2_loop
execute if score #phase skinwalker.phase matches 3 run function skinwalker:phase3_loop

# Handle disguise timers and checks
function skinwalker:abilities/disguise/check_disguise_timer

# Handle phased state for skinwalkers
function skinwalker:abilities/handle_phased

# Handle ability cooldowns and durations
execute as @a run {
    # Decrement cooldowns
    execute if score @s skinwalker.ability_cooldown matches 1.. run scoreboard players remove @s skinwalker.ability_cooldown 1
    
    # Decrement ability durations
    execute if score @s skinwalker.ability_duration matches 1.. run scoreboard players remove @s skinwalker.ability_duration 1
}

# Update scoreboard display every second (20 ticks)
scoreboard players add #scoreboard_timer skinwalker.temp 1
execute if score #scoreboard_timer skinwalker.temp matches 20.. run {
    scoreboard players set #scoreboard_timer skinwalker.temp 0
    function skinwalker:update_scoreboard
}

# Update team counts for win conditions
execute store result score #survivors_alive skinwalker.temp run team list survivors
execute store result score #skinwalkers_alive skinwalker.temp run team list skinwalkers

# Check win conditions
execute if score #game_phase skinwalker.phase matches 1..2 run {
    # If no survivors left, skinwalkers win
    execute if score #survivors_alive skinwalker.temp matches 0 run {
        function skinwalker:game/end_skinwalkers_win
    }
    
    # If no skinwalkers left, survivors win
    execute if score #skinwalkers_alive skinwalker.temp matches 0 run {
        function skinwalker:game/end_survivors_win
    }
}

# Schedule next iteration
schedule function skinwalker:game_loop 1t
