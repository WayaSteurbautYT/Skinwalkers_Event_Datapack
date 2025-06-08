# Add a clickable option for a survivor to disguise as

# Increment index
scoreboard players add #index skinwalker.temp 1

# Store target UUID in a tag for reference
tag @s add disguise_option_#index

# Calculate distance and store it in a temp score
scoreboard players set #distance skinwalker.temp 0
execute store result score #distance skinwalker.temp run data get entity @s Distance

# Add clickable option
tellraw @s ["\n  ",
    {"text":"[","color":"dark_gray"},
    {"text":"→","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger disguise_select set #index"}},
    {"text":"] ","color":"dark_gray"},
    {"selector":"@s","color":"white"},
    {"text":" (","color":"gray"},
    {"score":{"name":"#distance","objective":"skinwalker.temp"},"color":"yellow"},
    {"text":" blocks away)","color":"gray"}
]
