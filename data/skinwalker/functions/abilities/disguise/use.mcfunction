# Use Disguise ability

# Set cooldown (60 seconds)
scoreboard players set @s skinwalker.disguise_cooldown 1200

# Find nearest player to disguise as
execute as @p[limit=1,sort=nearest,distance=..10,team=!Skinwalker] at @s run function skinwalker:abilities/disguise/copy_identity

# Visual effects
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1
particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 20

tellraw @s ["",{"text":"[ABILITY] ","color":"dark_aqua"},{"text":"You've taken on a new identity!","color":"aqua"}]

# Disguise lasts for 30 seconds
schedule function skinwalker:abilities/disguise/remove_disguise 600t
