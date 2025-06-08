# Phase 2: Night Falls
# Set game phase
scoreboard players set #phase skinwalker.phase 2

# Update bossbar
bossbar set skinwalker:phase name ["",{"text":"Phase ","color":"white"},{"text":"2","color":"dark_red"},{"text":" - ","color":"gray"},{"text":"Night Falls","color":"dark_purple"}]
bossbar set skinwalker:phase color red
bossbar set skinwalker:value 2

# Set to night time and stormy weather
time set 13000
weather thunder 1000000
difficulty hard

# Play spooky sounds
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 0.8
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 0.7 # Add thunder sound with wither
schedule function skinwalker:phase2/play_ambient_sounds 5s replace

# Summon a few lightning bolts around players for dramatic effect (not hitting them)
execute at @a run summon minecraft:lightning_bolt ~10 ~ ~5
execute at @a run summon minecraft:lightning_bolt ~-10 ~ ~-5
execute at @a run particle minecraft:ash ~ ~1 ~ 5 5 5 0.5 200 force @a # Ash particles for atmosphere

# Message to all players
tellraw @a ["",{"text":"=== ","color":"dark_red"},{"text":"NIGHT HAS FALLEN","color":"red","bold":true},{"text":" ===\n","color":"dark_red"},{"text":"The Skinwalkers are active! Stay in the light and survive until morning!","color":"gray"}]

title @a title ["",{"text":"PHASE 2: NIGHT FALLS","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"Survive until morning!","color":"red"}]

# Enable Skinwalker abilities
execute as @a[tag=skinwalker] run function skinwalker:abilities/enable_skinwalker_abilities

# Start phase 2 loop
schedule function skinwalker:phase2/loop 1s replace
