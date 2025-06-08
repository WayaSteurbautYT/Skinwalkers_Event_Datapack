# Give initial items to all players based on their role
# This is called after roles are assigned

execute as @a[tag=skinwalker] run function skinwalker:abilities/give_skinwalker_abilities
execute as @a[tag=youtuber] run function skinwalker:abilities/give_youtuber_abilities
execute as @a[tag=survivor] run function skinwalker:abilities/give_survivor_abilities

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
