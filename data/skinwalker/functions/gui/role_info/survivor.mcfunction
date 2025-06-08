# Function: skinwalker:gui/role_info/survivor
# Purpose: Displays detailed information for the Survivor role.

tellraw @s {"text":"Your Role: ","color":"gray"},{"text":"SURVIVOR","color":"green","bold":true}
tellraw @s {"text":"Team: ","color":"gray"},{"text":"Survivors","color":"green"}
tellraw @s {"text":"Objective: ","color":"gray"},{"text":"Complete all assigned tasks and survive the Skinwalker.","color":"white"}
tellraw @s ""
tellraw @s {"text":"--- Items & Abilities ---","color":"green"}

# 1. Task Tracker
tellraw @s [ \
    {"text":"- Task Tracker (Compass): ","color":"white"}, \
    {"text":"[VIEW TASKS]","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:tasks/update_task_list"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to see your current tasks.","color":"yellow"}]}}, \
    {"text":"\n  Shows your current objectives.","color":"gray"} \
]

# 2. Flashlight
tellraw @s {"text":"- Flashlight (Lantern):","color":"white"}
tellraw @s {"text":"  Provides light. Right-click to toggle.","color":"gray"}

# 3. First Aid Kit
# Check cooldown status for First Aid Kit (skinwalker.cooldown.firstaid, assuming this is the one from give_survivor_abilities)
# The actual cooldown value is 60s.
tellraw @s {"text":"- First Aid Kit (Golden Apple):","color":"white"}
execute store result score #first_aid_cd skinwalker.temp run scoreboard players get @s skinwalker.cooldown.firstaid
execute if score #first_aid_cd skinwalker.temp matches 1.. run {
    tellraw @s [ \
        {"text":"  Heals you. Currently ","color":"gray"}, \
        {"text":"ON COOLDOWN","color":"red"}, \
        {"text":" (","color":"gray"}, \
        {"score":{"name":"#first_aid_cd","objective":"skinwalker.temp"},"color":"yellow"}, \
        {"text":"t left).","color":"gray"} \
    ]
}
execute if score #first_aid_cd skinwalker.temp matches 0 run {
    tellraw @s [ \
        {"text":"  Heals you. ","color":"gray"}, \
        {"text":"READY","color":"green"}, \
        {"text":" (60s cooldown after use).","color":"dark_gray"} \
    ]
}
execute unless score #first_aid_cd skinwalker.temp matches 0.. run { # Not set / negative
    tellraw @s [ \
        {"text":"  Heals you. ","color":"gray"}, \
        {"text":"READY","color":"green"}, \
        {"text":" (60s cooldown after use).","color":"dark_gray"} \
    ]
}


# 4. Adrenaline Shot
# This is a single-use item. Check if player still has it.
# (Assuming it's minecraft:potion{CustomModelData:3001})
# Checking inventory directly in tellraw is not possible.
# We can assume if they got it at the start, and it's single use, they either have it or used it.
# A tag like "used_adrenaline_shot" could be set on the player after use.
execute if entity @s[tag=used_adrenaline_shot] run {
    tellraw @s {"text":"- Adrenaline Shot (Potion):","color":"white"}
    tellraw @s {"text":"  USED.","color":"red"}
}
execute unless entity @s[tag=used_adrenaline_shot] run {
    tellraw @s {"text":"- Adrenaline Shot (Potion):","color":"white"}
    tellraw @s [ \
        {"text":"  Grants a burst of speed & regeneration. ","color":"gray"}, \
        {"text":"[USE]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:items/use_adrenaline_shot"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to use Adrenaline Shot (Single Use)","color":"aqua"}]}}, \
        {"text":" (Single Use).","color":"dark_gray"} \
    ]
}

# Reminder
tellraw @s ""
tellraw @s {"text":"Use ","color":"gray"},{"text":"/trigger open_player_hub","color":"aqua"},{"text":" again to refresh this info or view other options.","color":"gray"}
