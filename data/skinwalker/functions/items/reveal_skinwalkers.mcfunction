# Reveal nearby Skinwalkers

execute as @a[team=Skinwalker,distance=..20] run function skinwalker:items/reveal_skinwalker

tellraw @a[distance=..30,team=!Skinwalker] ["",{"text":"[BEACON] ","color":"yellow"},{"text":"A beacon reveals nearby Skinwalkers!","color":"white"}]
