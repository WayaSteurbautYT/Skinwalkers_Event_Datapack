# Phase 1: Survival - Initial setup

# Set phase duration (10 minutes = 12000 ticks, consistent with phase/check_phase_transition)
scoreboard players set #phase1_duration skinwalker.temp 12000
scoreboard players set #phase_timer skinwalker.temp 0 # Reset timer for the start of the phase
# '#phase skinwalker.phase 1' should be set by phase/advance_phase or game/start

# Reset tasks for all players (individual completion)
execute as @a[tag=!skinwalker] run scoreboard players set @s skinwalker.tasks_completed 0

# Give appropriate items/abilities based on role
execute as @a[tag=survivor] run function skinwalker:abilities/give_survivor_abilities
execute as @a[tag=youtuber] run function skinwalker:abilities/give_youtuber_abilities
# Skinwalkers get their abilities in assign_roles, no need to call here unless there are phase-specific additions

# Notify players
title @a title ["",{"text":"PHASE 1: SURVIVAL","color":"green","bold":true}]
title @a subtitle ["",{"text":"Complete tasks, stay vigilant!","color":"white"}]

tellraw @a ["\n",{"text":"=== ","color":"gold"},{"text":"PHASE 1: SURVIVAL","color":"green","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Survivors & YouTuber: Complete your ","color":"white"},{"text":"Tasks","color":"yellow"},{"text":".","color":"white"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Skinwalkers: Blend in, identify targets. Avoid detection.","color":"white"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Phase ends in ","color":"white"},{"text":"10 minutes","color":"yellow"},{"text":" or when all tasks are complete.","color":"white"}]

# Play phase start sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1

# Set up initial tasks
function skinwalker:tasks/setup_tasks

# Update scoreboard
function skinwalker:gui/update_scoreboard
