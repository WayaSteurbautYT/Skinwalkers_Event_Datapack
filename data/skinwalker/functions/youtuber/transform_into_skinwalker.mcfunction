# YouTuber transforms into a Skinwalker

tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" *screams* IT HURTS! MAKE IT STOP! *glitching*","color":"red"}]

# Play transformation sound and effects
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1.5
particle minecraft:entity_effect ~ ~1 ~ 1 2 1 0.5 200

# Change skin to Skinwalker
function skinwalker:skin/set_skinwalker

# Change team and tags
team join Skinwalker @s
tag @s add skinwalker
tag @s remove youtuber

# Give Skinwalker abilities
function skinwalker:abilities/give_skinwalker_abilities

# Announce to all players
tellraw @a ["",{"text":"The YouTuber has transformed into a ","color":"red"},{"text":"SKINWALKER!","color":"dark_red","bold":true}]
title @a title ["",{"text":"THE YOUTUBER IS A SKINWALKER!","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"RUN AND HIDE!","color":"red"}]

# Start phase 2 (night falls)
function skinwalker:phase2/start
