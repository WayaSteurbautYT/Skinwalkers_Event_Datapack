# YouTuber explains the challenge to players

# Different explanations based on YouTuber

execute as @s[scores={skinwalker.youtuber=1}] run tellraw @a ["",{"text":"[Dream]","color":"blue"},{"text":" Today we're playing a special game of survival. But there's a twist...","color":"white"}]

execute as @s[scores={skinwalker.youtuber=2}] run tellraw @a ["",{"text":"[MrBeast]","color":"blue"},{"text":" The challenge is simple: complete all the tasks I give you before time runs out!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=3}] run tellraw @a ["",{"text":"[Craftee]","color":"blue"},{"text":" We're going to see who can complete all the challenges first! Let's get started!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=4}] run tellraw @a ["",{"text":"[Preston]","color":"blue"},{"text":" Today we're doing a 100 PLAYER SURVIVAL CHALLENGE! Can you survive?","color":"white"}]

# Play sound effect
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1.0

# Schedule next dialogue
schedule function skinwalker:youtuber/give_first_task 3s replace
