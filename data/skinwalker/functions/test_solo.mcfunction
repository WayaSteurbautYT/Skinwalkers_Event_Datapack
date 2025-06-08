# Test mode: Solo (YouTuber)
# This sets up a single player as a YouTuber for testing

tellraw @a ["",{"text":"=== ","color":"gold"},{"text":"STARTING SOLO TEST MODE","color":"aqua","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"You are playing as a ","color":"gray"},{"text":"YouTuber","color":"blue","bold":true},{"text":" in solo mode!","color":"gray"}]

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

# Assign YouTuber role to all players
execute as @a run function skinwalker:roles/become_youtuber

# Start the game
function skinwalker:start_event
