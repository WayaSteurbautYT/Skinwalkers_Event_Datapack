# Phase 2: Hunt - Setup

# Set phase duration (in seconds, converted to ticks: seconds * 20)
scoreboard players set #phase2_duration skinwalker.temp 600  # 30 seconds * 20 ticks
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #phase skinwalker.phase 2

# Reveal Skinwalkers to all players
execute as @a[tag=skinwalker] run {
    # Make Skinwalkers visible and give them strength
    effect give @s minecraft:strength 30 0 true
    effect give @s minecraft:speed 30 1 true
    
    # Notify them they've been revealed
    title @s title ["",{"text":"YOUR COVER IS BLOWN!","color":"red","bold":true}]
    title @s subtitle ["",{"text":"Hunt down the survivors!","color":"white"}]
    
    # Give them combat items
    give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1004} 2
}

# Notify Survivors and YouTubers
execute as @a[tag=!skinwalker] run {
    title @s title ["",{"text":"PHASE 2: HUNT","color":"yellow","bold":true}]
    title @s subtitle ["",{"text":"The Skinwalkers have been revealed!","color":"white"}]
    
    # Give them defensive items
    give @s minecraft:golden_apple{display:{Name:'{"text":"Healing Apple","color":"gold","italic":false}'},HideFlags:32} 1
}

# Global announcement
tellraw @a ["\n",{"text":"=== ","color":"gold"},{"text":"PHASE 2: HUNT","color":"yellow","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"• ","color":"yellow"},{"text":"The ","color":"white"},{"text":"Skinwalkers","color":"red"},{"text":" have been revealed!","color":"white"}]
tellraw @a ["",{"text":"• ","color":"yellow"},{"text":"Survivors: ","color":"green"},{"text":"Survive for ","color":"white"},{"text":"5 minutes","color":"yellow"},{"text":" or eliminate all ","color":"white"},{"text":"Skinwalkers","color":"red"}]
tellraw @a ["",{"text":"• ","color":"yellow"},{"text":"Skinwalkers: ","color":"red"},{"text":"Eliminate all ","color":"white"},{"text":"Survivors","color":"green"},{"text":" and ","color":"white"},{"text":"YouTubers","color":"blue"}]

# Play phase start sound
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5

# Update scoreboard
function skinwalker:gui/update_scoreboard
