# Function: skinwalker:abilities/disguise/menu_select_mob_form
# Called from: Disguise menu (use_disguise_compass)
# Action: Presents a submenu for selecting a mob form.

# Cooldown is assumed to be already set by the main menu function.

tellraw @s {"text":"Select a mob form by clicking 'Transform':","color":"green"}
# Example Mobs (add more as needed)
# IMPORTANT: The $mob and $name parameters in the called function require Minecraft 1.20.2+
# Ensure the server supports this. The command used (/identity equip) is also plugin-dependent.

tellraw @s ["[Enderman] ",{"text":"Transform","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_mob_form {\"mob\":\"minecraft:enderman\", \"name\":\"Enderman\"}"}}]
tellraw @s ["[Zombie] ",{"text":"Transform","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_mob_form {\"mob\":\"minecraft:zombie\", \"name\":\"Zombie\"}"}}]
tellraw @s ["[Creeper] ",{"text":"Transform","color":"yellow","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/apply_mob_form {\"mob\":\"minecraft:creeper\", \"name\":\"Creeper\"}"}}]
# Add more mobs here following the pattern.

tellraw @s ["",{"text":"[Back to Main Disguise Menu]","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:items/use_disguise_compass_no_cooldown"}}]
tellraw @s ["",{"text":"[Cancel & Refund Cooldown]","color":"red","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/cancel_disguise_choice"}}]
