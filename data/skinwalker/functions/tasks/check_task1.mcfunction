# Check if players have completed the first task
# Task: Collect 16 logs and 32 stone

execute as @a[scores={skinwalker.task1=0}] if data entity @s Inventory[{id:"minecraft:oak_log",Count:16b}] if data entity @s Inventory[{id:"minecraft:stone",Count:32b}] run function skinwalker:tasks/complete_task1

# Reschedule check if not all players have completed
execute unless entity @a[scores={skinwalker.task1=0}] run return 0
schedule function skinwalker:tasks/check_task1 5s replace
