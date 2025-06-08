# Check kill mobs task completion

# This would be triggered by an advancement for killing mobs
# For now, we'll simulate it with a scoreboard

# Check if player has killed enough mobs
execute if score @s skinwalker.killed_mobs matches 10.. run function skinwalker:tasks/complete_task_kill_mobs
