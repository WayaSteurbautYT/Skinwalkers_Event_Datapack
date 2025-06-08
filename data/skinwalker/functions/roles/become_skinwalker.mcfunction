# Make player a Skinwalker
team join Skinwalker @s
tag @s add skinwalker
tag @s remove youtuber
tag @s remove survivor

# Set skin to Skinwalker
function skinwalker:skin/set_skinwalker

# Give abilities
function skinwalker:abilities/give_skinwalker_abilities

# Initial message
tellraw @s ["",{"text":"You are a ","color":"gray"},{"text":"SKINWALKER","color":"red","bold":true},{"text":"!\nBlend in and eliminate all survivors.","color":"gray"}]
title @s title ["",{"text":"You are a ","color":"gray"},{"text":"SKINWALKER","color":"red","bold":true}]
title @s subtitle ["",{"text":"Eliminate all survivors","color":"dark_red"}]

# Play sound
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 0.8
