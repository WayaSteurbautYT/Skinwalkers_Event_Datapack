# Test mode: Duo (1v1 - Survivor vs Skinwalker)
# This sets up a 2-player test with 1 Survivor and 1 Skinwalker

tellraw @a ["",{"text":"=== ","color":"gold"},{"text":"STARTING DUO TEST MODE","color":"aqua","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"1v1 Mode: ","color":"gray"},{"text":"Survivor ","color":"green"},{"text":"vs ","color":"gray"},{"text":"Skinwalker","color":"red"}]

# Clear all roles and teams
tag @a remove survivor
tag @a remove skinwalker
tag @a remove youtuber
team leave @a

# Set up teams
team add Survivor
team add Skinwalker

team option Survivor color green
team option Survivor prefix "§8[§aSURVIVOR§8] §r"

team option Skinwalker color red
team option Skinwalker prefix "§8[§cSKINWALKER§8] §r"

# Assign roles to players
execute as @a[sort=random,limit=1] run function skinwalker:roles/become_skinwalker
execute as @a[tag=!skinwalker] run function skinwalker:roles/become_survivor

# Start the game
function skinwalker:start_event
