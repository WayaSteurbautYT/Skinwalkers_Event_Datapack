# Disguise Selector - Right-click to select a disguise

# Check if player is a Skinwalker
execute unless entity @s[team=Skinwalker] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Only Skinwalkers can use this item!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check cooldown
execute if score @s skinwalker.ability_cooldown matches 1.. run {
    # Calculate remaining seconds
    scoreboard players operation #seconds skinwalker.temp = @s skinwalker.ability_cooldown
    scoreboard players operation #seconds skinwalker.temp /= 20 const
    scoreboard players add #seconds skinwalker.temp 1
    
    # Show cooldown message
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Disguise ability is on cooldown for ","color":"red"},{"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":" seconds","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check if already disguised
execute if entity @s[tag=disguised] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You're already disguised!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check for nearby survivors
execute unless entity @a[team=survivors,distance=..20,limit=1] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"No survivors nearby to disguise as!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Count nearby survivors
scoreboard players set #survivor_count skinwalker.temp 0
execute as @a[team=survivors,distance=..20] run function skinwalker:items/count_survivors

# Limit number of disguises to prevent chat spam
execute if score #survivor_count skinwalker.temp > 8 run {
    scoreboard players set #survivor_count skinwalker.temp 8
    tellraw @s ["",{"text":"[","color":"yellow"},{"text":"!","bold":true},{"text":"] ","color":"yellow"},{"text":"Too many survivors nearby! Showing only the closest 8.","color":"yellow"}]
}

# Show disguise selection GUI
tellraw @s ["\n\n",{"text":"           ","color":"dark_gray","strikethrough":true},{"text":"[ ","color":"dark_gray"},{"text":"DISGUISE SELECTOR","color":"red","bold":true},{"text":" ]","color":"dark_gray"},{"text":"           ","color":"dark_gray","strikethrough":true}]
tellraw @s ["",{"text":"Select a survivor to disguise as:","color":"gray","italic":true}]

# Reset index for options
scoreboard players set #index skinwalker.temp 0

# Add cancel option
tellraw @s ["\n  ",{"text":"[","color":"dark_gray"},{"text":"✖","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger disguise_cancel set 1"}},
{"text":"] ","color":"dark_gray"},{"text":"Cancel","color":"gray"}]

# Add each nearby survivor as an option (limited to 8 closest)
execute as @a[team=survivors,distance=..20,limit=8,sort=nearest] run function skinwalker:items/add_disguise_option

# Mark player as selecting disguise
tag @s add selecting_disguise

# Store the current time for cooldown if player closes GUI without selecting
scoreboard players operation #now skinwalker.temp = $time int 1
execute store result score @s skinwalker.last_disguise_attempt run scoreboard players get #now skinwalker.temp

# Schedule a check to clear the selecting_disguise tag if no selection is made within 30 seconds
schedule function skinwalker:items/clear_disguise_selection 30s replace

# Play sound
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
