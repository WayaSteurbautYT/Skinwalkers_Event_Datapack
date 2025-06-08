# Phase Shift ability

# Check cooldown
execute unless score @s skinwalker.phase_cooldown matches 1.. run function skinwalker:abilities/phase_shift/use

# Cooldown message
execute if score @s skinwalker.phase_cooldown matches 1.. run tellraw @s ["",{"text":"[ABILITY] ","color":"dark_purple"},{"text":"Phase Shift is on cooldown for ","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.phase_cooldown"},"color":"dark_purple"},{"text":" seconds","color":"gray"}]
