# Warning that night is approaching

execute as @a[tag=youtuber] run tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" Hurry up! Night is falling soon. You don't want to be out here when it gets dark...","color":"white"}]

# Play warning sound
playsound minecraft:entity.ender_eye.launch master @a ~ ~ ~ 1 0.8

title @a title ["",{"text":"NIGHT IS APPROACHING","color":"red"}]
title @a subtitle ["",{"text":"Find or build shelter!","color":"dark_red"}]
