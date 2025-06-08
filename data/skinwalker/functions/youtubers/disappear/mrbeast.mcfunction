# MrBeast disappears with a creepy message
tellraw @a ["",{"text":"[MrBeast]","color":"dark_red","italic":true},{"text":" It's using my skin. Don't trust it..."}]
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1 0.8
schedule function skinwalker:youtubers/leave/mrbeast 2s
