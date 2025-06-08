# Test mode: Trio (1v1v1 - YouTuber vs Survivor vs Skinwalker)
# This sets up a 3-player test with 1 of each role

tellraw @a ["",{"text":"=== ","color":"gold"},{"text":"STARTING TRIO TEST MODE","color":"aqua","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"1v1v1 Mode: ","color":"gray"},{"text":"YouTuber ","color":"blue"},{"text":"vs ","color":"gray"},{"text":"Survivor ","color":"green"},{"text":"vs ","color":"gray"},{"text":"Skinwalker","color":"red"}]

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

# Assign roles to players
execute as @a[sort=random,limit=1] run function skinwalker:roles/become_youtuber
execute as @a[tag=!youtuber,sort=random,limit=1] run function skinwalker:roles/become_skinwalker
execute as @a[tag=!youtuber,tag=!skinwalker] run function skinwalker:roles/become_survivor

# Start the game
function skinwalker:start_event
