# Main game loop - runs every tick
# This is the core loop that manages all game mechanics

# Handle start trigger
execute as @a[scores={skinwalker_trigger=1..}] run function skinwalker:start_trigger_handler

# Update player counts
execute store result score #survivors_alive skinwalker.temp run tag @a[tag=survivor] list
execute store result score #skinwalkers_alive skinwalker.temp run tag @a[tag=skinwalker] list

# Track YouTuber tasks every second
execute if score #tick skinwalker.temp matches ..0 run function skinwalker:game/track_tasks

# Update current game phase logic (runs phaseX/update)
function skinwalker:phase/update_phase

# Update bossbar with player counts and phase info
# Ensure #phase is the correct score to display for the current phase.
bossbar set skinwalker:players name ["",
    {"text":"Survivors: ","color":"green"},
    {"score":{"name":"#survivors_alive","objective":"skinwalker.temp"},"color":"white"},
    {"text":" | ","color":"gray"},
    {"text":"Skinwalkers: ","color":"red"},
    {"score":{"name":"#skinwalkers_alive","objective":"skinwalker.temp"},"color":"white"},
    {"text":" | Phase: ","color":"gray"},
    {"score":{"name":"#phase","objective":"skinwalker.phase"},"color":"yellow"}
]

# Check phase transitions and win conditions every second
execute if score #tick skinwalker.temp matches ..0 run {
    # Check if we should transition to the next phase
    function skinwalker:phase/check_phase_transition
    
    # Check win conditions
    function skinwalker:game/check_win_conditions
}

# Update player GUIs (every 5 ticks for performance)
# Consider changing the trigger from #tick..0 to a less frequent but regular interval if needed.
execute if score #tick skinwalker.temp matches ..0 run function skinwalker:gui/update_actionbar

function skinwalker:game/handle_item_clicks

# Handle disguise timers (every second)
execute if score #tick skinwalker.temp matches ..0 if entity @a[tag=disguised] run {
    function skinwalker:abilities/disguise/check_disguise_timer
}

# Handle ability cooldowns (every tick)
execute as @a run {
    # Decrement claws cooldown
    execute if score @s skinwalker.claws_cooldown matches 1.. run scoreboard players remove @s skinwalker.claws_cooldown 1
    
    # Decrement phase shift cooldown (objective name standardized to skinwalker.phase_cooldown)
    execute if score @s skinwalker.phase_cooldown matches 1.. run scoreboard players remove @s skinwalker.phase_cooldown 1
    
    # Decrement disguise cooldown
    execute if score @s skinwalker.disguise_cooldown matches 1.. run scoreboard players remove @s skinwalker.disguise_cooldown 1

    # Decrement Emergency Beacon cooldown
    execute if score @s skinwalker.beacon_cooldown matches 1.. run scoreboard players remove @s skinwalker.beacon_cooldown 1
}

# Handle YouTuber task tracking (every 5 seconds)
execute if score #tick skinwalker.temp matches 0 run function skinwalker:game/check_youtuber_tasks

# Handle infection timer for recently infected players (every tick)
execute as @a[tag=recently_infected] run {
    scoreboard players remove @s infection_timer 1
    execute if score @s infection_timer matches ..0 run {
        # First, call the full conversion function
        function skinwalker:convert_to_skinwalker

        # Remove the 'recently_infected' tag. convert_to_skinwalker does not handle this.
        tag @s remove recently_infected

        # The title "INFECTION COMPLETE" is redundant as convert_to_skinwalker provides its own comprehensive titles.
        # title @s title ["",{"text":"INFECTION COMPLETE","color":"dark_red","bold":true}]

        # These effects are specific to completing the infection timer, acting as a small bonus for the new Skinwalker.
        # convert_to_skinwalker does not grant these specific timed boosts.
        effect give @s minecraft:strength 10 0 true
        effect give @s minecraft:speed 10 0 true
    }
}

# Increment tick counter and reset every second (20 ticks)
scoreboard players add #tick skinwalker.temp 1
scoreboard players set #tick skinwalker.temp 0 20

# Update scoreboard sidebar (every second)
execute if score #tick skinwalker.temp matches ..0 run function skinwalker:gui/update_sidebar

# Reschedule this function to run every tick
schedule function skinwalker:game/tick 1 replace
