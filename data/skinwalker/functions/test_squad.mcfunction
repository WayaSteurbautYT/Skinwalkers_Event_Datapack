# Test mode: Squad (4+ players with balanced teams)
# This sets up a game with 4+ players with balanced roles

tellraw @a ["",{"text":"=== ","color":"gold"},{"text":"STARTING SQUAD TEST MODE","color":"aqua","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"Squad Mode: ","color":"gray"},{"text":"YouTuber","color":"blue"},{"text":", ","color":"gray"},{"text":"1-2 Skinwalkers","color":"red"},{"text":", ","color":"gray"},{"text":"rest Survivors","color":"green"}]

# Clear all roles and teams
tag @a remove survivor
tag @a remove skinwalker
tag @a remove youtuber
team leave @a

# Set up teams
team add Survivor
team add Skinwalker
team add YouTuber

team option Survivor color green
team option Survivor prefix "§8[§aSURVIVOR§8] §r"

team option Skinwalker color red
team option Skinwalker prefix "§8[§cSKINWALKER§8] §r"

team option YouTuber color blue
team option YouTuber prefix "§8[§9YOUTUBER§8] §r"

# Count players
scoreboard players set #playerCount playerCount 0
execute as @a run scoreboard players add #playerCount playerCount 1

# Assign 1 YouTuber
execute as @a[sort=random,limit=1] run function skinwalker:roles/become_youtuber

# Assign 1-2 Skinwalkers based on player count
execute as @a[tag=!youtuber,sort=random,limit=1] run function skinwalker:roles/become_skinwalker

# For 5+ players, add a second Skinwalker
execute if score #playerCount playerCount matches 5.. as @a[tag=!youtuber,tag=!skinwalker,sort=random,limit=1] run function skinwalker:roles/become_skinwalker

# Rest are Survivors
execute as @a[tag=!youtuber,tag=!skinwalker] run function skinwalker:roles/become_survivor

# Start the game
function skinwalker:start_event
