# Randomly select a YouTuber interaction
scoreboard players set #rng skinwalker.phase 0
scoreboard players random #rng skinwalker.phase 1 5

# Dream interaction
execute if score #rng skinwalker.phase matches 1 run function skinwalker:youtubers/interactions/dream

# MrBeast interaction
execute if score #rng skinwalker.phase matches 2 run function skinwalker:youtubers/interactions/mrbeast

# Technoblade interaction
execute if score #rng skinwalker.phase matches 3 run function skinwalker:youtubers/interactions/technoblade

# Craftee interaction
execute if score #rng skinwalker.phase matches 4 run function skinwalker:youtubers/interactions/craftee

# Preston interaction
execute if score #rng skinwalker.phase matches 5 run function skinwalker:youtubers/interactions/preston
