# Skinwalker Claws ability

# Check cooldown
execute unless score @s skinwalker.claws_cooldown matches 1.. run function skinwalker:abilities/claws/use

# Cooldown message
execute if score @s skinwalker.claws_cooldown matches 1.. run tellraw @s ["",{"text":"[ABILITY] ","color":"red"},{"text":"Claws are on cooldown for ","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.claws_cooldown"},"color":"red"},{"text":" seconds","color":"gray"}]
