# Reset the game completely

# Stop all sounds and music
stopsound @a
stopsound @a music
stopsound @a record

# Stop all scheduled functions
schedule clear skinwalker:game/tick
schedule clear skinwalker:game/extraction_countdown
schedule clear skinwalker:game/firework_show
schedule clear skinwalker:game/firework_show_dark

# Clear all players' inventories and effects
clear @a
effect clear @a

# Reset health, food and experience
gamemode survival @a
gamemode spectator @a[gamemode=spectator]
heal @a
hunger set @a 20
saturation set @a 20
xp set @a 0 levels
xp set @a 0 points

execute as @a run {
    # Clear all tags
    tag @s remove survivor
    tag @s remove skinwalker
    tag @s remove youtuber
    tag @s remove disguised
    tag @s remove disguised_as
    tag @s remove tasks_completed
    tag @s remove winner
    tag @s remove recently_infected
    
    # Reset skin to default
    function skinwalker:skin/set_default_skin
    
    # Clear scoreboard scores
    scoreboard players reset * skinwalker.role
    scoreboard players reset * skinwalker.phase
    scoreboard players reset * skinwalker.tasks
    scoreboard players reset * skinwalker.cooldown
    scoreboard players reset * skinwalker.ability_cooldown
    scoreboard players reset * skinwalker.ability_duration
    scoreboard players reset * skinwalker.claws_cooldown
    scoreboard players reset * skinwalker.phase_cooldown
    scoreboard players reset * skinwalker.disguise_cooldown
    scoreboard players reset * skinwalker.infection_timer
    scoreboard players reset * skinwalker.disguise_timer
    
    # Clear task tracking
    scoreboard players reset * skinwalker.task_mine_ores
    scoreboard players reset * skinwalker.task_craft_items
    scoreboard players reset * skinwalker.task_kill_mobs
    scoreboard players reset * skinwalker.task_travel_distance
    scoreboard players reset * skinwalker.task_build_structure
    scoreboard players reset * skinwalker.mined_ores
    scoreboard players reset * skinwalker.crafted_items
    scoreboard players reset * skinwalker.killed_mobs
    scoreboard players reset * skinwalker.traveled_blocks
    scoreboard players reset * skinwalker.built_blocks
    
    # Reset team
    team leave @s
}

# Clear all teams
team remove survivors
team remove skinwalkers
team remove youtubers

# Reset world border
worldborder set 1000000 0

# Reset game rules
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doMobSpawning true
gamerule keepInventory false
gamerule pvp false

# Reset time and weather
time set 1000
weather clear 1000000

# Clear all entities
kill @e[type=item]
kill @e[type=experience_orb]
kill @e[type=firework_rocket]
kill @e[type=armor_stand,tag=extraction_beacon]
kill @e[type=area_effect_cloud,tag=extraction_zone]

# Reset global variables
scoreboard players set #game_active skinwalker.phase 0
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #task_check_timer skinwalker.temp 0
scoreboard players set #phase_transition_timer skinwalker.temp 0
scoreboard players set #survivors_alive skinwalker.temp 0
scoreboard players set #skinwalkers_alive skinwalker.temp 0
scoreboard players set #youtubers_alive skinwalker.temp 0
scoreboard players set #extraction_timer skinwalker.temp 0

# Clear bossbars
bossbar remove skinwalker:game
bossbar remove skinwalker:extraction

# Send reset message
title @a title ["",{"text":"GAME RESET","color":"gold","bold":true}]
title @a subtitle ["",{"text":"The game has been reset. Ready for a new round!","color":"white"}]

# Play sound effect
playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1 1

# Clear action bars
title @a actionbar ""

# Send final message
tellraw @a ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"]
tellraw @a ["",
    {"text":"===============================================\n","color":"gold","bold":true},
    {"text":"              ","color":"white"},
    {"text":"GAME OVER","color":"gold","bold":true},
    {"text":"              \n","color":"white"},
    {"text":"===============================================\n\n","color":"gold","bold":true},
    {"text":"Thanks for playing ","color":"white"},
    {"text":"Skinwalkers","color":"red","bold":true},
    {"text":"!\n\n","color":"white"},
    {"text":"Type ","color":"gray"},
    {"text":"/function skinwalker:start_event","color":"yellow"},
    {"text":" to play again!\n\n","color":"gray"},
    {"text":"===============================================","color":"gold","bold":true}
]

# Play end sound
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.0
