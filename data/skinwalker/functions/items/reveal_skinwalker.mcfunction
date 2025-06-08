# Reveal a single Skinwalker

# Visual effects
effect give @s minecraft:glowing 200 0 true
particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 20
playsound minecraft:entity.evoker.prepare_summon player @a ~ ~ ~ 1 1

tellraw @s ["",{"text":"[WARNING] ","color":"red"},{"text":"You've been revealed by a beacon!","color":"white"}]

# Alert nearby players
execute at @s run tellraw @a[distance=..15,team=!Skinwalker] ["",{"text":"[WARNING] ","color":"red"},{"text":"A Skinwalker has been revealed nearby!","color":"white"}]
