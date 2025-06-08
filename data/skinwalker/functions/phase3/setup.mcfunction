# Phase 3: Finale - Setup

# Set phase duration (in seconds, converted to ticks: seconds * 20)
scoreboard players set #phase3_duration skinwalker.temp 300  # 15 seconds * 20 ticks
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #phase skinwalker.phase 3

# Give final buffs to all players
execute as @a[tag=survivor] run {
    effect give @s minecraft:strength 999999 0 true
    effect give @s minecraft:speed 999999 1 true
    effect give @s minecraft:resistance 999999 0 true
    
    # Give them final stand items
    give @s minecraft:totem_of_undying{display:{Name:'{"text":"Last Stand","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:3}],CustomModelData:1008} 1
    
    title @s title ["",{"text":"FINAL SHOWDOWN!","color":"red","bold":true}]
    title @s subtitle ["",{"text":"Fight for your life!","color":"white"}]
}

execute as @a[tag=skinwalker] run {
    effect give @s minecraft:strength 999999 1 true
    effect give @s minecraft:speed 999999 2 true
    effect give @s minecraft:resistance 999999 0 true
    
    # Give them final ability charges
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1004} 3
    
    title @s title ["",{"text":"FINAL HUNT!","color":"red","bold":true}]
    title @s subtitle ["",{"text":"Eliminate them all!","color":"white"}]
}

execute as @a[tag=youtuber] run {
    effect give @s minecraft:resistance 999999 1 true
    effect give @s minecraft:speed 999999 2 true
    
    # Give them escape items
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Emergency Teleport","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1007} 2
    
    title @s title ["",{"text":"ESCAPE OR DIE!","color":"red","bold":true}]
    title @s subtitle ["",{"text":"Survive at all costs!","color":"white"}]
}

# Global announcement
tellraw @a ["\n",{"text":"=== ","color":"red"},{"text":"FINAL PHASE: SHOWDOWN","color":"dark_red","bold":true},{"text":" ===","color":"red"}]
tellraw @a ["",{"text":"• ","color":"red"},{"text":"This is the final battle!","color":"white"}]
tellraw @a ["",{"text":"• ","color":"red"},{"text":"Survivors: ","color":"green"},{"text":"Eliminate the ","color":"white"},{"text":"Skinwalkers","color":"red"}]
tellraw @a ["",{"text":"• ","color":"red"},{"text":"Skinwalkers: ","color":"red"},{"text":"Hunt down the ","color":"white"},{"text":"Survivors","color":"green"},{"text":" and ","color":"white"},{"text":"YouTubers","color":"blue"}]
tellraw @a ["",{"text":"• ","color":"red"},{"text":"YouTubers: ","color":"blue"},{"text":"Survive until the end!","color":"white"}]

# Play dramatic sound
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.8

# Set world border for final battle
worldborder set 100 30
worldborder damage amount 1
worldborder damage buffer 5

# Update scoreboard
function skinwalker:gui/update_scoreboard

# Trigger Phase 3 narrative warnings
function skinwalker:events/warnings/run
schedule function skinwalker:events/skinwalker_dialogue/plan_sequence_1_part1 10s
