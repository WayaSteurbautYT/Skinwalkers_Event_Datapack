# Check build structure task completion

# This would check if player has built a structure
# For now, we'll simulate it with a command block or button press

# Check if player has built the structure
execute if score @s skinwalker.structure_built matches 1.. run function skinwalker:tasks/complete_task_build_structure
