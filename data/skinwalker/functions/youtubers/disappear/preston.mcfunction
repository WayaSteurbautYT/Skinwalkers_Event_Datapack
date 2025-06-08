# Preston disappears with a creepy message
tellraw @a ["",{"text":"[PrestonPlayz]","color":"dark_red","italic":true},{"text":" What did you let in...?"}]
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1 0.8
schedule function skinwalker:youtubers/leave/preston 2s
