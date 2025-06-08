# Final countdown before the end

title @a title ["",{"text":"You Let Him In","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"Now… the world ends.","color":"gray"}]
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1

# Kill all players
execute as @a run kill @s

# Final messages
tellraw @a ["",{"text":"[BREAKING NEWS]","color":"red"},{"text":" WayaSteurbautYTR has vanished. Last seen entering the End.","color":"gray"}]
tellraw @a ["",{"text":"[NEWS]","color":"red"},{"text":" All YouTubers presumed deleted.","color":"gray"}]
tellraw @a ["",{"text":"[SYSTEM]","color":"dark_red"},{"text":" The Skinwalker has won.","color":"red"}]

# Spawn floating text
summon armor_stand ~ ~ ~ {CustomNameVisible:1b,CustomName:'{"text":"I am everywhere","color":"dark_purple","italic":true}',Invisible:1b,NoGravity:1b,Marker:1b}

# Final advancement
title @a title ["",{"text":"Advancement Made!","color":"green"}]
title @a subtitle ["",{"text":"Skinwalker Unleashed","color":"dark_purple"}]
