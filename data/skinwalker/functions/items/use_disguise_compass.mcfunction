# Function: skinwalker:items/use_disguise_compass
# Item: carrot_on_a_stick{CustomModelData:1003}
# Called by: skinwalker:game/handle_item_clicks
# Action: Presents a disguise menu to the Skinwalker.

# Ensure the user is a skinwalker and cooldown is ready
execute unless entity @s[tag=skinwalker] run return 0
execute if score @s skinwalker.cooldown.disguise matches 1.. run tellraw @s {"text":"Disguise ability is on cooldown!","color":"red"}
execute if score @s skinwalker.cooldown.disguise matches 1.. run return 0

# Set cooldown (60 seconds = 1200 ticks)
# This cooldown is set upfront. If they cancel, it's refunded.
# If they choose an option that leads to another menu, that menu should not set this again.
# If they successfully disguise, this cooldown remains.
scoreboard players set @s skinwalker.cooldown.disguise 1200

# Set a short timer for how long this menu interaction itself can last, or a flag.
# For now, let's assume immediate choice or they can re-open.

tellraw @s {"text":"Choose your disguise type:","color":"gold"}
tellraw @s ["",{"text":"[1] Copy Nearby Player","color":"aqua","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/initiate_copy_nearby"}}]
tellraw @s ["",{"text":"[2] Select Specific Skin (URL)","color":"light_purple","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/menu_select_specific_skin"}}]
tellraw @s ["",{"text":"[3] Select Mob Form","color":"green","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/menu_select_mob_form"}}]
tellraw @s ["",{"text":"[Cancel]","color":"red","clickEvent":{"action":"run_command","value":"/function skinwalker:abilities/disguise/cancel_disguise_choice"}}]

# Play a sound
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1 1.2
