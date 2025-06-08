# Handle YouTuber extraction win condition
# This runs when all YouTubers have been successfully extracted

# Stop all scheduled functions
schedule clear skinwalker:game/tick
schedule clear skinwalker:game/extraction_countdown

# Set game over state
scoreboard players set #game_active skinwalker.phase 0

# Give YouTubers a victory item
execute as @a[tag=youtuber] run {
    give @s minecraft:nether_star{display:{Name:'{"text":"Victory Trophy","color":"aqua","italic":false}',Lore:['{"text":"Successfully escaped the Skinwalkers!","color":"blue"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:3}],CustomModelData:2004} 1
    
    # Apply glowing effect
    effect give @s minecraft:glowing 600 0 true
    
    # Give some fireworks
    give @s minecraft:firework_rocket{Fireworks:{Flight:3,Explosions:[{Type:4,Colors:[I;16755200],FadeColors:[I;16711680]}]}} 8
}

# Give survivors a participation reward
execute as @a[tag=survivor] run {
    give @s minecraft:emerald{display:{Name:'{"text":"Helper's Reward","color":"green","italic":false}',Lore:['{"text":"For helping the YouTubers escape!","color":"dark_green"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2005} 1
    effect give @s minecraft:glowing 600 0 true
}

# Notify all players of the winners
tellraw @a ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"]
tellraw @a ["",
    {"text":"===============================================\n","color":"aqua","bold":true},
    {"text":"               ","color":"white"},
    {"text":"VICTORY FOR THE YOUTUBERS!","color":"aqua","bold":true},
    {"text":"               \n","color":"white"},
    {"text":"===============================================\n\n","color":"aqua","bold":true},
    {"text":"Winners:","color":"yellow","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=youtuber]","color":"aqua"},
    {"text":"\n\n","color":"white"},
    {"text":"Helpers:","color":"green","bold":true},
    {"text":"\n• ","color":"white"},
    {"selector":"@a[tag=survivor]","color":"green"},
    {"text":"\n\n","color":"white"},
    {"text":"Game Over!","color":"gold","bold":true},
    {"text":"\nThe YouTubers have successfully escaped!\n\n","color":"white"},
    {"text":"===============================================","color":"aqua","bold":true}
]

# Play victory sound
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# Start firework show
function skinwalker:game/firework_show

# Schedule game reset in 1 minute
schedule function skinwalker:game/reset 1m
