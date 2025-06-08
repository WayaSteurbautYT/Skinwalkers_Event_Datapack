# Handle Survivors Win condition
# This runs when all Skinwalkers have been eliminated

# Stop all scheduled functions
schedule clear skinwalker:game/tick
schedule clear skinwalker:game/extraction_countdown

# Set game over state
scoreboard players set #game_active skinwalker.phase 0

# Stop all sounds
stopsound @a

# Play victory sounds
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.5
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2
playsound minecraft:entity.player.level.level_big master @a ~ ~ ~ 1 1

# Show victory title
title @a title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
title @a subtitle ["",{"text":"The Skinwalkers have been defeated!","color":"white"}]

# Give rewards to survivors
execute as @a[tag=survivor] run {
    # Give victory items
    give @s minecraft:diamond_sword{display:{Name:'{"text":"Victory Blade","color":"aqua","italic":false}',Lore:['{"text":"For surviving the Skinwalker attack!","color":"green"}']},Enchantments:[{id:"minecraft:sharpness",lvl:3},{id:"minecraft:unbreaking",lvl:3}],CustomModelData:2006} 1
    give @s minecraft:enchanted_golden_apple{display:{Name:'{"text":"Golden Victory","color":"gold","italic":false}'}} 2
    
    # Apply effects
    effect give @s minecraft:regeneration 30 1
    effect give @s minecraft:glowing 600 0 true
    effect give @s minecraft:speed 600 1
    
    # Play level up effect
    particle minecraft:end_rod ~ ~1 ~ 0.5 1 0.5 0.1 100
}

# Give participation rewards to YouTubers
execute as @a[tag=youtuber] run {
    give @s minecraft:emerald{display:{Name:'{"text":"Survivor's Medal","color":"green","italic":false}',Lore:['{"text":"For helping defeat the Skinwalkers!","color":"dark_green"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2007} 1
    effect give @s minecraft:glowing 600 0 true
}

# Notify all players of the winners
tellraw @a ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"]
tellraw @a ["",
    {"text":"===============================================\n","color":"green","bold":true},
    {"text":"               ","color":"white"},
    {"text":"VICTORY FOR THE SURVIVORS!","color":"green","bold":true},
    {"text":"               \n","color":"white"},
    {"text":"===============================================\n\n","color":"green","bold":true},
    {"text":"Survivors:","color":"green","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=survivor]","color":"green"},
    {"text":"\n\n","color":"white"},
    {"text":"Helpers:","color":"aqua","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=youtuber]","color":"aqua"},
    {"text":"\n\n","color":"white"},
    {"text":"Game Over!","color":"gold","bold":true},
    {"text":"\nThe Skinwalkers have been defeated!\n\n","color":"white"},
    {"text":"===============================================","color":"green","bold":true}
]

# Start firework show
function skinwalker:game/firework_show

# Schedule game reset in 1 minute
schedule function skinwalker:game/reset 1m
