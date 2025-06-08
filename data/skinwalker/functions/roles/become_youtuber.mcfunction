# Make player a YouTuber
team join YouTuber @s
tag @s add youtuber
tag @s remove skinwalker
tag @s remove survivor

# Set skin to random YouTuber
function skinwalker:skin/set_youtuber_skin

# Give abilities
function skinwalker:abilities/give_youtuber_abilities

# Initial message
tellraw @s ["",{"text":"You are a ","color":"gray"},{"text":"YOUTUBER","color":"blue","bold":true},{"text":"!\nHelp survivors complete tasks and survive.","color":"gray"}]
title @s title ["",{"text":"You are a ","color":"gray"},{"text":"YOUTUBER","color":"blue","bold":true}]
title @s subtitle ["",{"text":"Help survivors survive","color":"dark_blue"}]

# Play sound
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
