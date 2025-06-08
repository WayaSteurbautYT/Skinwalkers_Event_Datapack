# Function: skinwalker:gui/role_info/youtuber
# Purpose: Displays detailed information for the YouTuber role.

tellraw @s {"text":"Your Role: ","color":"gray"},{"text":"YOUTUBER","color":"blue","bold":true}
tellraw @s {"text":"Team: ","color":"gray"},{"text":"Survivors (Special Role)","color":"green"}
tellraw @s {"text":"Objective: ","color":"gray"},{"text":"Help Survivors complete tasks, use your unique abilities to gather information and protect them. Your survival is key.","color":"white"}
tellraw @s ""
tellraw @s {"text":"--- Items & Abilities ---","color":"blue"}

# 1. Task List (Book)
# Assumed to be given by give_youtuber_abilities.mcfunction
tellraw @s {"text":"- Task List (Book):","color":"white"}
tellraw @s {"text":"  Use this book to view and manage overall task progression (conceptual).","color":"gray"}
# Actual functionality of assigning tasks to survivors via the book would need specific functions.
# For now, it's an informational item in the GUI.

# 2. Emergency Beacon (Clock)
# Cooldown: skinwalker.beacon_cooldown (2 mins = 2400t)
tellraw @s {"text":"- Emergency Beacon (Clock):","color":"white"}
execute store result score #beacon_cd skinwalker.temp run scoreboard players get @s skinwalker.beacon_cooldown
execute if score #beacon_cd skinwalker.temp matches 1.. run {
    # Calculate seconds remaining for display
    scoreboard players operation #beacon_cd_seconds skinwalker.temp = #beacon_cd skinwalker.temp
    scoreboard players operation #beacon_cd_seconds skinwalker.temp /= 20 # Assuming 20 ticks per second

    tellraw @s [ \
        {"text":"  Reveals nearby Skinwalkers. Currently ","color":"gray"}, \
        {"text":"ON COOLDOWN","color":"red"}, \
        {"text":" (","color":"gray"}, \
        {"score":{"name":"#beacon_cd_seconds","objective":"skinwalker.temp"},"color":"yellow"}, \
        {"text":"s left).","color":"gray"} \
    ]
}
execute unless score #beacon_cd skinwalker.temp matches 1.. run { # Ready or not set
    tellraw @s [ \
        {"text":"  Reveals nearby Skinwalkers (10s duration, 2m cooldown). ","color":"gray"}, \
        {"text":"READY. ","color":"green"}, \
        {"text":"[USE]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:items/emergency_beacon"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to use Emergency Beacon.","color":"aqua"}]}} \
    ]
}

# 3. Influencer (Conceptual Passive)
tellraw @s {"text":"- Influencer (Passive):","color":"white"}
tellraw @s {"text":"  Survivors near you may gain small passive regeneration or task speed boosts. (Conceptual)","color":"gray"}
# This is a placeholder for a more unique YouTuber ability if desired later.

# Reminder
tellraw @s ""
tellraw @s {"text":"Use ","color":"gray"},{"text":"/trigger open_player_hub","color":"aqua"},{"text":" again to refresh this info or view other options.","color":"gray"}
