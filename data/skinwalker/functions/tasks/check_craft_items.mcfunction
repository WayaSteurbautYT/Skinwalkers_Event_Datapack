# Check craft items task completion

# This would be triggered by an advancement for crafting items
# For now, we'll simulate it with a scoreboard

# Check if player has crafted enough items
execute if score @s skinwalker.crafted_items matches 8.. run function skinwalker:tasks/complete_task_craft_items
