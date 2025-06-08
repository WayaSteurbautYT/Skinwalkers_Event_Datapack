# Triggered when player crafts an item

# Increment crafted items counter
scoreboard players add @s skinwalker.crafted_items 1

# Check if task is completed
execute if score @s skinwalker.crafted_items matches 8.. run function skinwalker:tasks/complete_task_craft_items
