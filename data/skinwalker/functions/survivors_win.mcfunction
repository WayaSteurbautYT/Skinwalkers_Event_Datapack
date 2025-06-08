# Survivors win condition

# Set game over
scoreboard players set #phase skinwalker.phase 10

title @a title ["",{"text":"SURVIVORS WIN","color":"green","bold":true}]
title @a subtitle ["",{"text":"The infection has been contained","color":"dark_green"}]

# Play sound to all players
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Reveal all Skinwalkers
execute as @a[team=Skinwalker] run effect give @s minecraft:glowing 30 0 true

# Start end sequence
schedule function skinwalker:end_sequence 5s
