# YouTuber's introduction message based on which YouTuber they are

# Dream
execute as @s[scores={skinwalker.youtuber=1}] run tellraw @a ["",{"text":"[Dream]","color":"blue"}," ",{"text":"Hey guys! Welcome to a brand new challenge! Today we're playing a special game of survival with a twist...","color":"white"}]

# MrBeast
execute as @s[scores={skinwalker.youtuber=2}] run tellraw @a ["",{"text":"[MrBeast]","color":"blue"}," ",{"text":"LET'S GOOOOO! Welcome to the biggest Minecraft challenge EVER! We're giving away $10,000 to the winner!","color":"white"}]

# Craftee
execute as @s[scores={skinwalker.youtuber=3}] run tellraw @a ["",{"text":"[Craftee]","color":"blue"}," ",{"text":"What's up everyone! Welcome to a brand new Minecraft challenge! Today we're doing something CRAZY!","color":"white"}]

# Preston
execute as @s[scores={skinwalker.youtuber=4}] run tellraw @a ["",{"text":"[Preston]","color":"blue"}," ",{"text":"WOOO! What's going on guys! Today we're playing a 100 PLAYER SURVIVAL CHALLENGE IN MINECRAFT!","color":"white"}]

# Default for any other YouTuber
execute as @s[scores={skinwalker.youtuber=5..}] run tellraw @a ["",{"text":"[YouTuber]","color":"blue"}," ",{"text":"Hey everyone! Welcome to this special Minecraft challenge! Let's have some fun!","color":"white"}]
