# Phase 3: The Skinwalker Reveal

# Set phase
scoreboard players set #phase skinwalker.phase 3

# Dramatic pause
title @a title ["",{"text":"...","color":"dark_red"}]
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 0.5

# Waya returns
execute as @a run title @s title ["",{"text":"HE'S BACK","color":"dark_red","bold":true}]
execute as @a run title @s subtitle ["",{"text":"You let him in...","color":"gray","italic":true}]
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1

# Waya joins
tellraw @a {"text":"WayaSteurbautYTR joined the game","color":"yellow"}

# Switch to adventure mode and teleport to The End
gamemode adventure @a
execute in minecraft:the_end run tp @a ~ ~ ~

# Skinwalker message
tellraw @a ["",{"text":"[Skinwalker]","color":"dark_red"},{"text":" I used all their faces. Now I wear yours."}]

# Final countdown
schedule function skinwalker:phase3_countdown 3s
