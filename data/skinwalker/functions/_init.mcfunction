# Initialize scoreboards
scoreboard objectives add skinwalker.phase dummy
scoreboard objectives add skinwalker.role dummy
scoreboard objectives add skinwalker.timer dummy
scoreboard objectives add skinwalker.tasks dummy
scoreboard objectives add skinwalker.cooldown dummy
scoreboard objectives add skinwalker.youtuber dummy
scoreboard objectives add skinwalker.start_cooldown dummy

# Set up teams
team add Survivor
team modify Survivor color green
team add Skinwalker
team modify Skinwalker color red
team add YouTuber
team modify YouTuber color blue

# Set up display
scoreboard objectives setdisplay sidebar skinwalker.role

# Set up initial values
scoreboard players set #phase skinwalker.phase 0
scoreboard players set #timer skinwalker.timer 0
scoreboard players set #tasks skinwalker.tasks 0
scoreboard players set #playerCount dummy 0

# Initialize player tags
tag @a remove survivor
tag @a remove skinwalker
tag @a remove youtuber

# Clear effects

# Register commands
function skinwalker:register_commands
effect clear @a

# Set game mode
gamemode survival @a

# Set time to day
time set day
weather clear

tellraw @a ["",{"text":"Skinwalker Event ","color":"gold","bold":true},{"text":"initialized! Type ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":" to begin.","color":"gray"}]
