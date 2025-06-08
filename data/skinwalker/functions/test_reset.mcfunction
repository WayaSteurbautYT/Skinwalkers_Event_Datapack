# Test function to verify reset works
# Run this with: /function skinwalker:test_reset

tellraw @a ["",{"text":"[","color":"gold"},{"text":"TEST","color":"yellow","bold":true},{"text":"] ","color":"gold"},{"text":"Testing reset function...","color":"white"}]

# Run the reset
function skinwalker:reset

# Verify reset worked
execute unless score #phase skinwalker.phase matches 0 run tellraw @a ["",{"text":"[","color":"red"},{"text":"!","color":"dark_red","bold":true},{"text":"] ","color":"red"},{"text":"Reset failed - Phase not set to 0","color":"white"}]

execute if score #phase skinwalker.phase matches 0 run tellraw @a ["",{"text":"[","color":"green"},{"text":"✓","color":"dark_green","bold":true},{"text":"] ","color":"green"},{"text":"Reset successful! Phase is ","color":"white"},{"score":{"name":"#phase","objective":"skinwalker.phase"},"color":"yellow"}]
