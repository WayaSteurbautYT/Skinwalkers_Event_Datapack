# Phase 1: YouTuber Invasion - Initial setup and YouTuber appearances

# Set phase
scoreboard players set #phase skinwalker.phase 1

# Initial announcement
tellraw @a ["",{"text":"[SERVER]","color":"gray"},{"text":" YouTubers are joining the server..."}]

# YouTuber join messages
function skinwalker:youtubers/join/dream
function skinwalker:youtubers/join/mrbeast
function skinwalker:youtubers/join/technoblade
function skinwalker:youtubers/join/craftee
function skinwalker:youtubers/join/preston

# Start the event loop
schedule function skinwalker:phase1_loop 10s
