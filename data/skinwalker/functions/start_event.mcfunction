# ===================================
# SKINWALKER EVENT - GAME INITIALIZATION
# ===================================

# Check if Skinwalker gamemode is selected. If not, run placeholder and exit.
execute unless score #GAME_SETTINGS skinwalker.gamemode_selected matches 1 run function skinwalker:game/start_vanilla_placeholder
execute unless score #GAME_SETTINGS skinwalker.gamemode_selected matches 1 run return run

# Call the main game reset function (handles player state, scores, schedules, world state etc.)
function skinwalker:game/reset

# Reset game state (global scores for a new round)
# Note: game/reset handles most score resets for players and some globals.
# Specific global game state scores are set here.
scoreboard players set #phase skinwalker.phase 0 # Will be set to 1 by phase1/setup
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #phase_transition_timer skinwalker.temp 0
scoreboard players set #task_check_timer skinwalker.temp 0
scoreboard players set #tasks_completed skinwalker.tasks_completed 0
scoreboard players set #total_tasks skinwalker.tasks_total 5  # Default number of tasks

# Player tags, inventory, effects, team leaving are handled by skinwalker:game/reset

# Setup bossbar
# Ensure previous one is gone, in case reset didn't catch it.
bossbar remove skinwalker:phase
execute run bossbar add skinwalker:phase {"text":"Game Starting...","color":"dark_purple"} # Updated text
execute run bossbar set skinwalker:phase players @a
# bossbar max/value will be updated by phase functions.

# Assign roles using the main assignment function
# This handles player count, role distribution, tagging, team joining, and giving initial items/abilities.
function skinwalker:assign_roles

# Set up scoreboard display (assign_roles should ideally handle sidebar display if it's role-based)
scoreboard objectives setdisplay sidebar skinwalker.role # Keep for now, ensure assign_roles doesn't conflict

# Give initial items and effects - This is called by assign_roles via give_initial_items path.
# function skinwalker:give_initial_items # REMOVE - Redundant if assign_roles handles it.

# Start Phase 1
# assign_roles should have set #phase to 0 or similar initial state.
# phase1/setup will set #phase to 1 and call phase1/start.
function skinwalker:phase1/setup # This sets #phase to 1 and schedules phase1/start
# scoreboard players set #phase skinwalker.phase 1 # This is done in phase1/setup
# function skinwalker:phase1/start # This is scheduled by phase1/setup or game/start

# Notify players (Much of this is also in phase1/start and phase1/setup)
# Consolidate startup messages within those phase files.
# title @a title ["",{"text":"SKINWALKER EVENT","color":"gold","bold":true}]
# title @a subtitle ["",{"text":"Phase 1: Survival","color":"green"}]

# tellraw @a ["\n\n",{"text":"=== ","color":"gold"},{"text":"WELCOME TO SKINWALKER EVENT","color":"yellow","bold":true},{"text":" ===","color":"gold"}]
# tellraw @a ["",{"text":"\nPhase 1: ","color":"green","bold":true},{"text":"Survival\n","color":"white"}]
# tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Complete tasks to survive","color":"white"}]
# tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Beware of ","color":"white"},{"text":"Skinwalkers","color":"red"}]
# tellraw @a ["",{"text":"• ","color":"gray"},{"text":"Use ","color":"white"},{"text":"/skinwalker help","color":"yellow"},{"text":" for commands","color":"white"}]

# Play start sound (Consider moving to phase1/start for more thematic entry)
playsound minecraft:event.raid.horn master @a ~ ~ ~ 0.8 1.2
playsound minecraft:entity.zombie_villager.converted master @a ~ ~ ~ 1 1

# GUI Updates
function skinwalker:gui/update_scoreboard
# function skinwalker:gui/update_scoreboard # Duplicate removed

# Set time to day and clear weather (phase1/start should handle this)
# time set day
# weather clear

# Start the game loop
# scoreboard objectives add skinwalker.temp dummy # Redundant, setup_scoreboard does this
scoreboard players set #phase_timer skinwalker.temp 0 # Reset before tick starts
schedule function skinwalker:game/tick 1t replace # Ensure tick loop is running
# execute run function skinwalker:phase/advance_phase # This is too early, phase1/setup and phase1/start handle advancing to phase 1.