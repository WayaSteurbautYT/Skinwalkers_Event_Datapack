# YouTuber gives the final task before the twist

# Play dramatic sound
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.8

# YouTuber starts acting strange
execute as @a[tag=youtuber] run tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" *static* I... I don't feel so good... *glitches*","color":"white"}]

# Wait a moment
schedule function skinwalker:youtuber/glitch_effect 2s replace
