# Triggered when player kills a mob

# Increment killed mobs counter
scoreboard players add @s skinwalker.killed_mobs 1

# Check if task is completed
execute if score @s skinwalker.killed_mobs matches 10.. run function skinwalker:tasks/complete_task_kill_mobs
