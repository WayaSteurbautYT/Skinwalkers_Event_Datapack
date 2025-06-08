# Assign a random role to a player

# Check if we still need Skinwalkers
scoreboard players get #skinwalkers skinwalker.role
execute if score #skinwalkers skinwalker.role > 0 run function skinwalker:assign_skinwalker

# If not assigned as Skinwalker, make them a Survivor
execute unless score @s skinwalker.role matches 1.. run function skinwalker:assign_survivor

# Update counter if assigned as Skinwalker
function skinwalker:update_skinwalker_count
