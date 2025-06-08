# Check travel distance task completion

# This would track player movement
# For now, we'll simulate it with a scoreboard

# Check if player has traveled enough distance
execute if score @s skinwalker.distance_traveled matches 1000.. run function skinwalker:tasks/complete_task_travel_distance
