# Phase 3: Final Countdown Setup

# Set the phase
scoreboard players set #phase skinwalker.phase 3

# Set the time to midnight and weather to thunder
time set 18000
weather thunder

# Announce phase transition
title @a title ["",{"text":"PHASE 3: FINAL COUNTDOWN","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"Last chance to survive!","color":"white"}]

# Play dramatic sound effect
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.5
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1

# Notify all players
tellraw @a ["",{"text":"=== ","color":"dark_red"},{"text":"PHASE 3: FINAL COUNTDOWN","color":"dark_red","bold":true},{"text":" ===\n","color":"dark_red"},{"text":"2 minutes until the final confrontation!","color":"red"}]

# Reset phase timer for phase 3 (2 minutes)
scoreboard players set #phase_timer skinwalker.temp 0

# Give all players final effects
effect give @a minecraft:glowing 100 0 true
effect give @a minecraft:strength 100 0 true

# Set world border to start closing in
worldborder set 1000 120
worldborder damage amount 2
worldborder damage buffer 2

# Announce final phase
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
