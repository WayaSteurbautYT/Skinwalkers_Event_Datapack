# Technoblade disappears with a creepy message
tellraw @a ["",{"text":"[Technoblade]","color":"dark_red","italic":true},{"text":" Too late to save them..."}]
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1 0.8
schedule function skinwalker:youtubers/leave/technoblade 2s
