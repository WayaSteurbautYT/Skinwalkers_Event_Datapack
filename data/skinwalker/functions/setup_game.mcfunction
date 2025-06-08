# Setup game with assigned roles

# Clear previous teams
execute as @a run team leave @s

# Count players
scoreboard players set #totalPlayers skinwalker.role 0
execute as @a run scoreboard players add #totalPlayers skinwalker.role 1

# Calculate number of Skinwalkers (1 per 3 players, minimum 1)
scoreboard players set #skinwalkers skinwalker.role 1
scoreboard players set #temp skinwalker.role 3

execute if score #totalPlayers skinwalker.role > 3 run scoreboard players set #skinwalkers skinwalker.role 2
execute if score #totalPlayers skinwalker.role > 6 run scoreboard players set #skinwalkers skinwalker.role 3

# Assign roles
execute as @a[scores={skinwalker.role=0}] run function skinwalker:assign_role

# Set up initial game state
scoreboard players set #phase skinwalker.phase 0
scoreboard players set #timer skinwalker.timer 0
scoreboard players set #tasks skinwalker.tasks 0

tellraw @a ["",{"text":"[GAME]","color":"gold"},{"text":" Roles have been assigned! Check your sidebar for your role."}]
tellraw @a ["",{"text":"[GAME]","color":"gold"},{"text":" The game will start in 10 seconds..."}]

# Start the game after 10 seconds
schedule function skinwalker:start_event 10s
