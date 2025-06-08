# Disguise as another player

# Check cooldown
execute unless score @s skinwalker.disguise_cooldown matches 1.. run function skinwalker:abilities/disguise/use

# Cooldown message
execute if score @s skinwalker.disguise_cooldown matches 1.. run tellraw @s ["",{"text":"[ABILITY] ","color":"dark_aqua"},{"text":"Disguise is on cooldown for ","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.disguise_cooldown"},"color":"dark_aqua"},{"text":" seconds","color":"gray"}]
