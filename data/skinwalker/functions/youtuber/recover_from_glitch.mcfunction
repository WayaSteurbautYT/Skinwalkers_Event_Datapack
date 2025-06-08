# YouTuber recovers from the glitch

execute as @s run tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" *panting* I-I'm okay... I think. That was weird.","color":"white"}]

# Play recovery sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Give final task after a moment
schedule function skinwalker:youtuber/give_actual_final_task 3s replace
