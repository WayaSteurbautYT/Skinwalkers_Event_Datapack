# Skinwalkers win condition

# Set game over
scoreboard players set #phase skinwalker.phase 10

title @a title ["",{"text":"SKINWALKERS WIN","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"The infection has spread","color":"red"}]

# Play sound to all players
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5

# Teleport all players to the center
tp @a 0 100 0

# Start end sequence
schedule function skinwalker:end_sequence 5s
