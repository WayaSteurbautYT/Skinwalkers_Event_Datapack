# Convert dead player to spectator

team leave @s
team join Spectator @s
gamemode spectator @s
title @s title ["",{"text":"YOU DIED","color":"dark_red"}]
title @s subtitle ["",{"text":"Now spectating the game","color":"gray"}]

tellraw @s ["",{"text":"[GAME]","color":"gray"},{"text":" You are now a spectator. Wait for the next round!"}]

# Play sound to the player
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 1
