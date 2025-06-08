# Start the extraction countdown for YouTubers
# This runs when an extraction beacon is placed

# Schedule the extraction countdown to run every second
schedule function skinwalker:game/extraction_countdown 1s replace

# Initial countdown message
tellraw @a ["",
    {"text":"[","color":"aqua"},
    {"text":"!","color":"dark_aqua","bold":true},
    {"text":"] ","color":"aqua"},
    {"text":"Extraction in ","color":"green"},
    {"text":"30","color":"yellow","bold":true},
    {"text":" seconds!","color":"green"}
]

# Play sound effect
playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 1 1
