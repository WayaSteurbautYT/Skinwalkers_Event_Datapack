# Attack a player with claws

# Damage the player (3 hearts)
damage @s 6

# Knockback
execute at @s run tp @s ^ ^ ^-1

# Visual effects
particle minecraft:crit ~ ~1 ~ 0.5 1 0.5 0.1 20
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 1

title @s title ["",{"text":"SLASHED!","color":"dark_red","bold":true}]
title @s subtitle ["",{"text":"You've been attacked by a Skinwalker!","color":"red"}]

# Alert nearby players
execute at @s run tellraw @a[distance=..20,team=!Skinwalker] ["",{"text":"[WARNING] ","color":"red"},{"text":"You hear a scream nearby!","color":"white"}]

# Check if player died
execute unless entity @s run function skinwalker:on_player_death
