# Function: skinwalker:abilities/disguise/cancel_disguise_choice
# Called from: Disguise sub-menus
# Action: Cancels the disguise choice and refunds the cooldown.

# Reset cooldown if player cancels from a sub-menu
scoreboard players set @s skinwalker.cooldown.disguise 0
# Also clear any active disguise timer if one was prematurely set (though current flow doesn't set it until apply_ function)
scoreboard players set @s skinwalker.disguise_timer 0
# Remove general 'disguised' tag if it was added prematurely
tag @s remove disguised

tellraw @s {"text":"Disguise selection cancelled. Cooldown refunded.","color":"yellow"}
playsound minecraft:block.iron_trapdoor.close master @s ~ ~ ~ 1 1.2
