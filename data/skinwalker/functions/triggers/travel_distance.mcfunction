# Triggered when player moves

# Increment distance traveled (this runs every tick while moving)
scoreboard players add @s skinwalker.distance_traveled 1

# Check if task is completed (1000 blocks = ~5 minutes of walking)
execute if score @s skinwalker.distance_traveled matches 1000.. run function skinwalker:tasks/complete_task_travel_distance
