# Initialize scoreboards and teams when the datapack loads

# Setup all scoreboard objectives and teams
function skinwalker:setup_scoreboard

# Set default gamemode to Skinwalker (1)
scoreboard players set #GAME_SETTINGS skinwalker.gamemode_selected 1

# Initialize player tags
tag @a remove survivor
tag @a remove skinwalker
tag @a remove youtuber
tag @a remove disguised
tag @a remove disguised_as
tag @a remove joined

# Clear all teams
team remove survivors
team remove skinwalkers

# Recreate teams with proper settings
team add survivors
team modify survivors color green
team modify survivors displayName "Survivors"
team modify survivors friendlyFire false

team add skinwalkers
team modify skinwalkers color red
team modify skinwalkers displayName "Skinwalkers"
team modify skinwalkers seeFriendlyInvisibles true

# Set game rules
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doMobSpawning true
gamerule keepInventory false
gamerule pvp false

# Set time and weather
time set 1000
weather clear 1000000

# Reset world border
worldborder set 1000000 0

# Send welcome message
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"gold"},{"text":"] ","color":"dark_gray"},{"text":"Skinwalker Event ","color":"red"},{"text":"v5.0","color":"gold"},{"text":" loaded! Type ","color":"white"},{"text":"/trigger skinwalker_start","color":"yellow"},{"text":" to begin!","color":"white"}]

# Create start trigger
scoreboard objectives add skinwalker_trigger trigger

# Setup teams
team modify Survivor color green
team modify Survivor prefix ["",{"text":"[","color":"gray"},{"text":"SURVIVOR","color":"green"},{"text":"] ","color":"gray"}]

team add Skinwalker
team modify Skinwalker color red
team modify Skinwalker prefix ["",{"text":"[","color":"gray"},{"text":"SKINWALKER","color":"red"},{"text":"] ","color":"gray"}]

team add Spectator
team modify Spectator color gray
team modify Spectator prefix ["",{"text":"[","color":"gray"},{"text":"SPECTATOR","color":"gray"},{"text":"] ","color":"gray"}]

# Set up display
scoreboard objectives setdisplay sidebar skinwalker.role

tellraw @a ["",{"text":"Skinwalker Game Mode ","color":"gold"},{"text":"loaded!","color":"yellow"}]
tellraw @a ["",{"text":"Type ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":" to begin","color":"gray"}]

# Enable the player hub trigger for all players
execute as @a run scoreboard players enable @s open_player_hub
tellraw @a ["",{"text":"Tip: Use ","color":"gray"},{"text":"/trigger open_player_hub","color":"aqua"},{"text":" to view your role, tasks, and abilities!","color":"gray"}]
