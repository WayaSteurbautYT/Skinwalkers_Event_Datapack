# Check if player has built a structure

# This would be called by a repeating command block in the world
# Example command: execute as @a[team=Survivor] at @s if block ~ ~-1 ~ minecraft:crafting_table run function skinwalker:triggers/check_structure

# Check for a 10x10 area of blocks (simplified example)
execute if blocks ~-5 ~-1 ~-5 ~5 ~4 ~5 ~-5 ~-1 ~-5 all run function skinwalker:tasks/complete_task_build_structure
