# Start Phase 1 of the game

# Set up the world
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doMobSpawning false
gamerule keepInventory false
gamerule pvp false

# Set time to day
time set 1000
weather clear 1000000

# Initialize teams
team add survivors
team modify survivors color green
team modify survivors displayName "Survivors"
team modify survivors friendlyFire false
team modify survivors seeFriendlyInvisibles true

team add skinwalkers
team modify skinwalkers color red
team modify skinwalkers displayName "Skinwalkers"
team modify skinwalkers seeFriendlyInvisibles true

team add spectators
team modify spectators color gray
team modify spectators displayName "Spectators"
team modify spectators friendlyFire false

# Clear all players from teams
execute as @a run {
    team leave @s
    
    # Clear inventory and effects
    clear @s
    effect clear @s
    
    # Set to survival mode
    gamemode survival @s
    
    # Clear scoreboard tags
    tag @s remove skinwalker
    tag @s remove survivor
    tag @s remove disguised
    tag @s remove has_night_vision
    tag @s remove phased
    
    # Reset scores
    scoreboard players set @s skinwalker.ability_cooldown 0
    scoreboard players set @s skinwalker.ability_duration 0
    scoreboard players set @s skinwalker.task_mine_ores 0
    scoreboard players set @s skinwalker.task_craft_items 0
    scoreboard players set @s skinwalker.task_kill_mobs 0
    scoreboard players set @s skinwalker.task_travel_distance 0
    scoreboard players set @s skinwalker.task_build_structure 0
}

# Assign roles to players
function skinwalker:game/assign_roles

# Start the main game loop
schedule function skinwalker:game_loop 20t

# Send start message
title @a title ["",{"text":"PHASE 1: TASKS","color":"green","bold":true}]
title @a subtitle ["",{"text":"Survivors complete tasks, Skinwalkers blend in!","color":"white"}]

# Play sound effect
playsound minecraft:entity.player.level_up master @a ~ ~ ~ 1 1

# Set up the world border
worldborder center 0 0
worldborder set 1000 30
worldborder warning distance 20
worldborder warning time 15

# Set game phase
scoreboard players set #game_phase skinwalker.phase 1

# Initialize scoreboard display
function skinwalker:update_scoreboard

# Notify all players
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Phase 1 has started! ","color":"white"},
{"text":"Survivors","color":"green"},{"text":" must complete tasks while ","color":"white"},{"text":"Skinwalkers","color":"red"},{"text":" try to blend in!","color":"white"}]

# Start phase 1 loop
schedule function skinwalker:phase1_loop 3s
