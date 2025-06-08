# Craftee disappears with a creepy message
tellraw @a ["",{"text":"[Craftee]","color":"dark_red","italic":true},{"text":" I'm not Craftee. I never was..."}]
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1 0.8
schedule function skinwalker:youtubers/leave/craftee 2s
