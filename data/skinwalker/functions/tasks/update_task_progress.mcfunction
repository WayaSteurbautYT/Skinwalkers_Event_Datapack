# Update a player's task progress
# Parameters:
#   - storage skinwalker:temp TaskType - The type of task to update
#   - storage skinwalker:temp TaskIncrement - The amount to increment the progress by

# Update the appropriate task counter
execute store result score #current_progress skinwalker.temp run data get storage skinwalker:temp TaskType
execute store result score #increment skinwalker.temp run data get storage skinwalker:temp TaskIncrement

# Update the appropriate task counter
execute if score #current_progress skinwalker.temp matches 1 run scoreboard players add @s skinwalker.task_mine_ores #increment skinwalker.temp
execute if score #current_progress skinwalker.temp matches 2 run scoreboard players add @s skinwalker.task_craft_items #increment skinwalker.temp
execute if score #current_progress skinwalker.temp matches 3 run scoreboard players add @s skinwalker.task_kill_mobs #increment skinwalker.temp
execute if score #current_progress skinwalker.temp matches 4 run scoreboard players add @s skinwalker.task_travel_distance #increment skinwalker.temp
execute if score #current_progress skinwalker.temp matches 5 run scoreboard players add @s skinwalker.task_build_structure #increment skinwalker.temp

# Update the actionbar
execute if score @s skinwalker.phase matches 1 run function skinwalker:tasks/update_actionbar

# Check if any tasks were completed
function skinwalker:tasks/check_task_completion
