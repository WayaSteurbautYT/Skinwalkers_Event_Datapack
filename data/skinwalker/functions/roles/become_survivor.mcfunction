# Make player a Survivor
team join Survivor @s
tag @s add survivor
tag @s remove skinwalker
tag @s remove youtuber

# Set skin to default
function skinwalker:skin/set_default_skin

# Give abilities
function skinwalker:abilities/give_survivor_abilities

# Initial message
tellraw @s ["",{"text":"You are a ","color":"gray"},{"text":"SURVIVOR","color":"green","bold":true},{"text":"!\nComplete tasks and survive the night.","color":"gray"}]
title @s title ["",{"text":"You are a ","color":"gray"},{"text":"SURVIVOR","color":"green","bold":true}]
title @s subtitle ["",{"text":"Complete tasks and survive","color":"dark_green"}]

# Play sound
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
