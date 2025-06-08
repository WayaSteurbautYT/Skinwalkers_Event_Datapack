# ===================================
# SKINWALKER EVENT - GAME INITIALIZATION
# ===================================

# Initialize scoreboards
scoreboard objectives add skinwalker.phase dummy
scoreboard objectives add skinwalker.role dummy
scoreboard objectives add skinwalker.temp dummy
scoreboard objectives add skinwalker.tasks_completed dummy
scoreboard objectives add skinwalker.tasks_total dummy
scoreboard objectives add playerCount dummy

# Reset game state
scoreboard players set #phase skinwalker.phase 0
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #phase_transition_timer skinwalker.temp 0
scoreboard players set #task_check_timer skinwalker.temp 0
scoreboard players set #tasks_completed skinwalker.tasks_completed 0
scoreboard players set #total_tasks skinwalker.tasks_total 5  # Default number of tasks

# Clear all players
tag @a remove survivor
tag @a remove skinwalker
tag @a remove youtuber
tag @a remove disguised
tag @a remove disguised_as

# Clear inventories and effects
execute as @a run clear @s
execute as @a run effect clear @s

# Reset and set up teams
team remove Survivor
team remove Skinwalker
team remove YouTuber

team add Survivor
scoreboard teams option Survivor color green
scoreboard teams option Survivor prefix "§8[§aSURVIVOR§8] §r"
scoreboard teams option Survivor friendlyFire false

team add Skinwalker
scoreboard teams option Skinwalker color red
scoreboard teams option Skinwalker prefix "§8[§cSKINWALKER§8] §r"
scoreboard teams option Skinwalker friendlyFire false

team add YouTuber
scoreboard teams option YouTuber color blue
scoreboard teams option YouTuber prefix "§8[§9YOUTUBER§8] §r"
scoreboard teams option YouTuber friendlyFire false

# Setup bossbar
execute run bossbar remove skinwalker:phase
execute run bossbar add skinwalker:phase {"text":"Phase 0: Starting...","color":"green"}
execute run bossbar set skinwalker:phase players @a
execute run bossbar set skinwalker:max 3
execute run bossbar set skinwalker:value 0

# Count players and assign roles
scoreboard players set #playerCount playerCount 0
execute as @a run scoreboard players add #playerCount playerCount 1

# Assign roles based on player count
execute if score #playerCount playerCount matches 1 run function skinwalker:roles/assign_solo
execute if score #playerCount playerCount matches 2 run function skinwalker:roles/assign_duo
execute if score #playerCount playerCount matches 3 run function skinwalker:roles/assign_trio
execute if score #playerCount playerCount matches 4.. run function skinwalker:roles/assign_squad

# Set up teams
execute as @a[tag=survivor] run team join Survivor @s
execute as @a[tag=skinwalker] run team join Skinwalker @s
execute as @a[tag=youtuber] run team join YouTuber @s

# Set up scoreboard display
scoreboard objectives setdisplay sidebar skinwalker.role

# Give initial items and effects
function skinwalker:give_initial_items

# Start Phase 1
scoreboard players set #phase skinwalker.phase 1
function skinwalker:phase1/setup

# Notify players
title @a title ["",{"text":"SKINWALKER EVENT","color":"gold","bold":true}]
title @a subtitle ["",{"text":"Phase 1: Survival","color":"green"}]

tellraw @a ["\n\n",{"text":"=== ","color":"gold"},{"text":"WELCOME TO SKINWALKER EVENT","color":"yellow","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"\nPhase 1: ","color":"green","bold":true},{"text":"Survival\n","color":"white"}]
tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Complete tasks to survive","color":"white"}]
tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Beware of ","color":"white"},{"text":"Skinwalkers","color":"red"}]
tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Use ","color":"white"},{"text":"/skinwalker help","color":"yellow"},{"text":" for commands","color":"white"}]

# Play start sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Universal event start alias for user convenience
# Universal start command for the datapack
# Calls the main game start logic
function skinwalker:commands/startpdate scoreboard
function skinwalker:gui/update_scoreboard

# Set time to day and clear weather
time set day
weather clear

# Start the game loop
scoreboard objectives add skinwalker.temp dummy
scoreboard players set #phase_timer skinwalker.temp 0
execute run function skinwalker:phase/advance_phase