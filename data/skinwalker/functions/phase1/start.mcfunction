# Phase 1: YouTuber Introduction
# Set game phase
scoreboard players set #phase skinwalker.phase 1

# Update bossbar
bossbar set skinwalker:phase name ["",{"text":"Phase ","color":"white"},{"text":"1","color":"yellow"},{"text":" - ","color":"gray"},{"text":"YouTuber Arrival","color":"blue"}]
bossbar set skinwalker:phase color blue
bossbar set skinwalker:value 1

# Play sound for all players
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5

# Send title to all players
title @a title ["",{"text":"PHASE 1","color":"blue","bold":true}]
title @a subtitle ["",{"text":"The YouTuber has arrived...","color":"gray"}]

# Schedule YouTuber introduction
schedule function skinwalker:phase1/youtuber_intro 3s replace

# Set day time and weather
time set day
weather clear 1000000
difficulty normal

# Set world border
worldborder set 1000
worldborder warning distance 50
worldborder warning time 10

# Send welcome message to all players
tellraw @a ["",{"text":"=== ","color":"dark_gray"},{"text":"SKINWALKER EVENT","color":"red","bold":true},{"text":" ===\n","color":"dark_gray"},{"text":"A YouTuber has arrived with challenges!\nComplete tasks and survive the night...","color":"gray"}]
