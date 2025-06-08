# Function: skinwalker:gui/role_info/skinwalker
# Purpose: Displays detailed information for the Skinwalker role.

tellraw @s {"text":"Your Role: ","color":"gray"},{"text":"SKINWALKER","color":"red","bold":true}
tellraw @s {"text":"Team: ","color":"gray"},{"text":"Skinwalkers","color":"red"}
tellraw @s {"text":"Objective: ","color":"gray"},{"text":"Eliminate all Survivors and the YouTuber. Blend in using your disguise.","color":"white"}
tellraw @s ""
tellraw @s {"text":"--- Abilities ---","color":"red"}

# 1. Disguise
# Cooldown: skinwalker.disguise_cooldown (60s = 1200t)
# Duration: skinwalker.disguise_timer (30s = 600t)
tellraw @s {"text":"- Disguise (Compass):","color":"white"}
execute store result score #disguise_cd skinwalker.temp run scoreboard players get @s skinwalker.disguise_cooldown
execute store result score #disguise_timer skinwalker.temp run scoreboard players get @s skinwalker.disguise_timer

execute if score #disguise_timer skinwalker.temp matches 1.. run {
    # Currently Disguised
    tellraw @s [ \
        {"text":"  Active! You are disguised. Duration: ","color":"gray"}, \
        {"score":{"name":"#disguise_timer","objective":"skinwalker.temp"},"color":"aqua"}, \
        {"text":"t left. ","color":"gray"}, \
        {"text":"[REMOVE DISGUISE]","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/remove_disguise"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to remove your disguise early.","color":"yellow"}]}} \
    ]
} else {
    # Not Currently Disguised - Check Cooldown
    execute if score #disguise_cd skinwalker.temp matches 1.. run {
        tellraw @s [ \
            {"text":"  ON COOLDOWN","color":"red"}, \
            {"text":" (","color":"gray"}, \
            {"score":{"name":"#disguise_cd","objective":"skinwalker.temp"},"color":"yellow"}, \
            {"text":"t left). Copies appearance of a nearby non-Skinwalker.","color":"gray"} \
        ]
    }
    execute unless score #disguise_cd skinwalker.temp matches 1.. run { # Ready or not set
        tellraw @s [ \
            {"text":"  READY","color":"green"}, \
            {"text":". Copies appearance (30s duration, 60s cooldown). ","color":"gray"}, \
            {"text":"[USE]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:items/use_disguise_compass"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to use Disguise.","color":"aqua"}]}} \
        ]
    }
}

# 2. Skinwalker Claws
# Cooldown: skinwalker.claws_cooldown (assumption, check game/tick if it exists)
# For now, let's assume it's an item with its own use, or passive. The `give_skinwalker_abilities` gives an Iron Sword.
# Let's assume it's always available, no specific cooldown listed in tellraw for now.
tellraw @s {"text":"- Skinwalker Claws (Iron Sword):","color":"white"}
tellraw @s {"text":"  Your primary weapon.","color":"gray"}
# If it had a special activation:
# {"text":"[ACTIVATE CLAWS]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/claws/use"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to activate Claws.","color":"aqua"}]}}


# 3. Phase Shift
# Cooldown: skinwalker.phase_cooldown (30s = 600t, from previous review)
tellraw @s {"text":"- Phase Shift (Ender Pearl):","color":"white"}
execute store result score #phase_cd skinwalker.temp run scoreboard players get @s skinwalker.phase_cooldown
execute if score #phase_cd skinwalker.temp matches 1.. run {
    tellraw @s [ \
        {"text":"  Teleport forward. Currently ","color":"gray"}, \
        {"text":"ON COOLDOWN","color":"red"}, \
        {"text":" (","color":"gray"}, \
        {"score":{"name":"#phase_cd","objective":"skinwalker.temp"},"color":"yellow"}, \
        {"text":"t left).","color":"gray"} \
    ]
}
execute unless score #phase_cd skinwalker.temp matches 1.. run {
    tellraw @s [ \
        {"text":"  Teleport forward. ","color":"gray"}, \
        {"text":"READY","color":"green"}, \
        {"text":" (30s cooldown). ","color":"dark_gray"}, \
        {"text":"[USE]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/phase_shift/use"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to use Phase Shift.","color":"aqua"}]}} \
    ]
}

# 4. Night Vision
tellraw @s {"text":"- Night Vision (Passive):","color":"white"}
tellraw @s {"text":"  You can see clearly in the dark.","color":"gray"}

# Reminder
tellraw @s ""
tellraw @s {"text":"Use ","color":"gray"},{"text":"/trigger open_player_hub","color":"aqua"},{"text":" again to refresh this info or view other options.","color":"gray"}
