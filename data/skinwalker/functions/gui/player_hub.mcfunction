# Function: skinwalker:gui/player_hub
# Purpose: Triggered by /trigger open_player_hub. Displays main GUI options to the player.
# Resets the trigger to allow it to be used again.

# Reset the trigger so the player can use it again immediately
scoreboard players set @s open_player_hub 0

# Main Hub Title
tellraw @s ""
tellraw @s {"text":"====== Player Hub ======","color":"gold","bold":true}
tellraw @s ""

# Option 1: Role Information & Abilities
tellraw @s [ \
    {"text":"[","color":"gray"}, \
    {"text":"Role & Abilities","color":"blue","clickEvent":{"action":"run_command","value":"/function skinwalker:gui/show_role_info"},"hoverEvent":{"action":"show_text","contents":[{"text":"View your current role, objectives, and abilities.","color":"blue"}]}}, \
    {"text":"]","color":"gray"} \
]

# Option 2: Task Progress
tellraw @s [ \
    {"text":"[","color":"gray"}, \
    {"text":"Task Progress","color":"green","clickEvent":{"action":"run_command","value":"/function skinwalker:tasks/update_task_list"},"hoverEvent":{"action":"show_text","contents":[{"text":"View your assigned tasks and their progress.","color":"green"}]}}, \
    {"text":"]","color":"gray"} \
]
# (Assuming skinwalker:tasks/update_task_list shows info to @s)

# Option 3: Team Status
tellraw @s [ \
    {"text":"[","color":"gray"}, \
    {"text":"Team Status","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:gui/show_team_status"},"hoverEvent":{"action":"show_text","contents":[{"text":"View status of other players.","color":"yellow"}]}}, \
    {"text":"]","color":"gray"} \
]

# Option 4: Help / Info
# tellraw @s [ \
#     {"text":"[","color":"gray"}, \
#     {"text":"Help & Info","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:gui/show_help_info"},"hoverEvent":{"action":"show_text","contents":[{"text":"General game information and tips.","color":"aqua"}]}}, \
#     {"text":"]","color":"gray"} \
# ]
# (Help section can be added later)

tellraw @s ""
tellraw @s {"text":"======================","color":"gold","bold":true}

# Play a subtle UI sound
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.7 1.5
