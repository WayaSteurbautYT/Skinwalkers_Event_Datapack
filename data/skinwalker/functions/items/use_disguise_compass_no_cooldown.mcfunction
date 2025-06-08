# Function: skinwalker:items/use_disguise_compass_no_cooldown
# Called from: Sub-menus of the disguise system
# Action: Presents the main disguise menu WITHOUT affecting existing cooldown.

# Ensure the user is a skinwalker
execute unless entity @s[tag=skinwalker] run return 0

# Cooldown is NOT checked or set here, assuming player is navigating menus.

tellraw @s {"text":"Choose your disguise type:","color":"gold"}
tellraw @s ["",{"text":"[1] Copy Nearby Player","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/initiate_copy_nearby"}}]
tellraw @s ["",{"text":"[2] Select Specific Skin (URL)","color":"light_purple","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/menu_select_specific_skin"}}]
tellraw @s ["",{"text":"[3] Select Mob Form","color":"green","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/menu_select_mob_form"}}]
tellraw @s ["",{"text":"[Cancel & Refund Cooldown]","color":"red","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/cancel_disguise_choice"}}]

# Play a sound
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1.2
