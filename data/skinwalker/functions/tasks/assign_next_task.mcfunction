# Assign the next task to a player based on their task seed
# Called from assign_initial_tasks.mcfunction

# Get the next task type based on the seed
scoreboard players operation #task_type skinwalker.temp = #temp skinwalker.temp
scoreboard players add #temp skinwalker.temp 1
scoreboard players operation #temp skinwalker.temp %= 7 const

# Assign the task based on the type
execute if score #task_type skinwalker.temp matches 0 run function skinwalker:tasks/assign_mining_task
execute if score #task_type skinwalker.temp matches 1 run function skinwalker:tasks/assign_crafting_task
execute if score #task_type skinwalker.temp matches 2 run function skinwalker:tasks/assign_combat_task
execute if score #task_type skinwalker.temp matches 3 run function skinwalker:tasks/assign_travel_task
execute if score #task_type skinwalker.temp matches 4 run function skinwalker:tasks/assign_building_task
execute if score #task_type skinwalker.temp matches 5 run function skinwalker:tasks/assign_breeding_task
execute if score #task_type skinwalker.temp matches 6 run function skinwalker:tasks/assign_fishing_task

# Increment the task count and check if we need more tasks
scoreboard players add @s skinwalker.task_count 1
execute if score @s skinwalker.task_count matches 0..4 run function skinwalker:tasks/assign_next_task
