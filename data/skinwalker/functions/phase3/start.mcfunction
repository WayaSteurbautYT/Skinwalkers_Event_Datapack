# Phase 3: The Final Showdown
# Set game phase
scoreboard players set #phase skinwalker.phase 3

# Update bossbar
bossbar set skinwalker:phase name ["",{"text":"Phase ","color":"white"},{"text":"3","color":"dark_red"},{"text":" - ","color":"gray"},{"text":"Final Showdown","color":"dark_red"}]
bossbar set skinwalker:phase color dark_red
bossbar set skinwalker:value 3

# Set weather to clear and time to day
weather clear 1000000
time set 1000

# Play dramatic sound
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1.0
playsound minecraft:event.raid.horn master @a ~ ~15 ~ 1.5 0.7
playsound minecraft:event.raid.horn master @a ~ ~15 ~ 1.5 0.8
playsound minecraft:music_disc.ward master @a ~ ~ ~ 2.0 1.0 # Play some intense music if available via resource pack or default

# Add particles for dramatic showdown feel
particle minecraft:warped_spore ~ ~2 ~ 10 5 10 0.5 500 force @a
particle minecraft:totem_of_undying ~ ~1 ~ 1 1 1 0.1 100 force @a

# Message to all players
tellraw @a ["",{"text":"=== ","color":"dark_red"},{"text":"THE FINAL SHOWDOWN","color":"red","bold":true},{"text":" ===\n","color":"dark_red"},{"text":"The Skinwalker has been cornered! Work together to defeat it!","color":"gray"}]

title @a title ["",{"text":"PHASE 3: FINAL SHOWDOWN","color":"red","bold":true}]
title @a subtitle ["",{"text":"Defeat the Skinwalker!","color":"dark_red"}]

# Teleport all players to the arena
# execute as @a run teleport @s ~ 100 ~  # Adjust coordinates as needed

# Give final weapons/items
give @a[tag=survivor] minecraft:diamond_sword{Enchantments:[{id:sharpness,lvl:3}],display:{Name:'{"text":"Skinwalker Slayer","color":"red"}'}} 1
give @a[tag=survivor] minecraft:golden_apple 3

# Start final battle loop
schedule function skinwalker:phase3/loop 1s replace
