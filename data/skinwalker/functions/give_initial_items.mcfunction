# Give initial items to all players based on their role
# This is called after roles are assigned
# Role-specific abilities and items are now handled by their respective `become_role` functions.

# Give everyone some food
clear @s minecraft:bread 0 1
give @s minecraft:bread 16

# Set initial health and food levels
effect give @s minecraft:saturation 1 0 true
effect give @s minecraft:regeneration 5 0 true

# Set initial game mode
gamemode survival @a[tag=!youtuber]
gamemode survival @a[tag=youtuber]  # YouTubers can be in creative if needed

# Set initial spawn point
spawnpoint @s ~ ~ ~
