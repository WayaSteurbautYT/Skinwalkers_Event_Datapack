# Triggered when player mines an ore

# Increment ores mined counter
scoreboard players add @s skinwalker.ores_mined 1

# Check if task is completed
execute if score @s skinwalker.ores_mined matches 16.. run function skinwalker:tasks/complete_task_mine_ores
