# End game sequence

title @a title ["",{"text":"GAME OVER","color":"dark_purple","bold":true}]
title @a subtitle ["",{"text":"Thanks for playing!","color":"light_purple"}]

# Clear effects
effect clear @a

# Drop all items
execute as @a run function minecraft:loot
execute as @a run clear @s

# Reset game state in 10 seconds
schedule function skinwalker:reset_game 10s
