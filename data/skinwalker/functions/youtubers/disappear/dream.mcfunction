# Dream disappears with a creepy message
tellraw @a ["",{"text":"[Dream]","color":"dark_red","italic":true},{"text":" I'm not in control anymore..."}]
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1 0.8
schedule function skinwalker:youtubers/leave/dream 2s
