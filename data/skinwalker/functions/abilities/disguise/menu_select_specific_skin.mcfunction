# Function: skinwalker:abilities/disguise/menu_select_specific_skin
# Called from: Disguise menu (use_disguise_compass)
# Action: Presents a submenu for selecting a predefined skin URL.

# Cooldown is assumed to be already set by the main menu function.

tellraw @s {"text":"Select a specific skin by clicking 'Apply':","color":"light_purple"}
# Example Skins (add more as needed from user's list)
# IMPORTANT: The $url and $name parameters in the called function require Minecraft 1.20.2+
# Ensure the server supports this, otherwise this approach needs changing (e.g. temp storage + one function call).

tellraw @s ["[SW Normal] ",{"text":"Apply","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_skin_url {\"url\":\"https://files.catbox.moe/cb8c8a.png\", \"name\":\"Skinwalker\"}"}}]
tellraw @s ["[SW Waya] ",{"text":"Apply","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_skin_url {\"url\":\"https://files.catbox.moe/qxdjf2.png\", \"name\":\"Skinwalker Waya\"}"}}]
tellraw @s ["[Dream SW] ",{"text":"Apply","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_skin_url {\"url\":\"https://files.catbox.moe/9gf4xa.png\", \"name\":\"Dream Skinwalker\"}"}}]
tellraw @s ["[Normal Steve] ",{"text":"Apply","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_skin_url {\"url\":\"https://files.catbox.moe/zq4kyt.png\", \"name\":\"Steve?\"}"}}]
# Add more skins here following the pattern.

tellraw @s ["",{"text":"[Back to Main Disguise Menu]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:items/use_disguise_compass_no_cooldown"}}]
tellraw @s ["",{"text":"[Cancel & Refund Cooldown]","color":"red","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/cancel_disguise_choice"}}]
