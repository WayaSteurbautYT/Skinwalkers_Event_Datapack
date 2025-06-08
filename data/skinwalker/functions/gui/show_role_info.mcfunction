# Function: skinwalker:gui/show_role_info
# Purpose: Displays role-specific information to the player (@s).
# Acts as a dispatcher based on the player's role tag.

tellraw @s ""
tellraw @s {"text":"--- Role Information ---","color":"blue","bold":true}

execute if entity @s[tag=survivor] run function skinwalker:gui/role_info/survivor
execute if entity @s[tag=skinwalker] run function skinwalker:gui/role_info/skinwalker
execute if entity @s[tag=youtuber] run function skinwalker:gui/role_info/youtuber

# Fallback if no role tag is found (e.g., before roles are assigned or for spectators without a specific role view)
execute if entity @s[tag=!survivor,tag=!skinwalker,tag=!youtuber] run {
    tellraw @s {"text":"You do not have a defined role in the Skinwalker event at this moment.","color":"gray"}
    tellraw @s {"text":"If the game is in progress, you might be a spectator or waiting for assignment.","color":"gray"}
}

tellraw @s {"text":"----------------------","color":"blue","bold":true}
tellraw @s ""

# Play a UI sound
playsound minecraft:item.book.page_turn master @s ~ ~ ~ 0.7 1.6
