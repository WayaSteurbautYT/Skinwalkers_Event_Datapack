# Handle Skinwalkers Win condition
# This runs when all Survivors and YouTubers have been eliminated

# Stop all scheduled functions
schedule clear skinwalker:game/tick
schedule clear skinwalker:game/extraction_countdown

# Set game over state
scoreboard players set #game_active skinwalker.phase 0

# Stop all sounds
stopsound @a

# Play victory sounds
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1.5
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1.2
playsound minecraft:entity.elder_guardian.curse master @a ~ ~ ~ 1 0.8

# Show victory title
title @a title ["",{"text":"SKINWALKERS WIN!","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"The survivors have been eliminated!","color":"red"}]

# Give rewards to Skinwalkers
execute as @a[tag=skinwalker] run {
    # Give victory items
    give @s minecraft:netherite_sword{display:{Name:'{"text":"Fang of the Skinwalker","color":"dark_red","italic":false}',Lore:['{"text":"A trophy from your victory!","color":"red"}']},Enchantments:[{id:"minecraft:sharpness",lvl:4},{id:"minecraft:fire_aspect",lvl:2}],CustomModelData:2008} 1
    give @s minecraft:totem_of_undying{display:{Name:'{"text":"Essence of the Hunt","color":"gold","italic":false}',Lore:['{"text":"Your prey could not escape...","color":"red"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3}],CustomModelData:2009} 1
    
    # Apply effects
    effect give @s minecraft:strength 600 1
    effect give @s minecraft:glowing 600 0 true
    effect give @s minecraft:speed 600 1
    effect give @s minecraft:resistance 600 0
    
    # Play transformation effect
    particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.1 100
    particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 50
}

# Notify all players of the winners
tellraw @a ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"]
tellraw @a ["",
    {"text":"===============================================\n","color":"dark_red","bold":true},
    {"text":"               ","color":"white"},
    {"text":"VICTORY FOR THE SKINWALKERS!","color":"red","bold":true},
    {"text":"               \n","color":"white"},
    {"text":"===============================================\n\n","color":"dark_red","bold":true},
    {"text":"Skinwalkers:","color":"red","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=skinwalker]","color":"red"},
    {"text":"\n\n","color":"white"},
    {"text":"Prey Eliminated:","color":"gray","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=!skinwalker]","color":"gray"},
    {"text":"\n\n","color":"white"},
    {"text":"Game Over!","color":"gold","bold":true},
    {"text":"\nThe Skinwalkers have taken over!\n\n","color":"white"},
    {"text":"===============================================","color":"dark_red","bold":true}
]

# Start firework show
function skinwalker:game/firework_show_dark

# Schedule game reset in 1 minute
schedule function skinwalker:game/reset 1m
