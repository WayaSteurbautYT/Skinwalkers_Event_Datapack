# Check if players have completed the second task
# Task: Craft a full set of iron armor and tools

execute as @a[scores={skinwalker.task2=0}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_helmet"}]}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_chestplate"}]}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_leggings"}]}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_boots"}]}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_sword"}]}] if entity @s[nbt={Inventory:[{id:"minecraft:iron_pickaxe"}]}] run function skinwalker:tasks/complete_task2

# Reschedule check if not all players have completed
execute unless entity @a[scores={skinwalker.task2=0}] run return 0
schedule function skinwalker:tasks/check_task2 5s replace
