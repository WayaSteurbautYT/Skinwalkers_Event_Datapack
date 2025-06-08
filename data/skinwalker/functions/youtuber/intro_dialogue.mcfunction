# YouTuber's introduction dialogue
# This is customized based on which YouTuber they are

# Default intro for any YouTuber
execute as @s[scores={skinwalker.youtuber=1}] run tellraw @a ["",{"text":"[Dream]","color":"blue"},{"text":" Hey everyone! Thanks for watching my video! Today we're doing something special...","color":"white"}]

execute as @s[scores={skinwalker.youtuber=2}] run tellraw @a ["",{"text":"[MrBeast]","color":"blue"},{"text":" LET'S GO! Today I'm giving away $10,000 to whoever can complete all the challenges!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=3}] run tellraw @a ["",{"text":"[Craftee]","color":"blue"},{"text":" What's up everyone! Today we're building something crazy in Minecraft!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=4}] run tellraw @a ["",{"text":"[Preston]","color":"blue"},{"text":" WOOO! What's going on guys! Today we're playing a brand new Minecraft challenge!","color":"white"}]

# Play sound effect
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Schedule next dialogue
schedule function skinwalker:youtuber/explain_challenge 3s replace
