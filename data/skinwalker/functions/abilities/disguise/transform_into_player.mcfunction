# Transform a Skinwalker into a specific player
# This function is called when a Skinwalker successfully uses their disguise ability

# Store the target player's name for reference
data modify storage skinwalker:temp TargetName set from storage skinwalker:temp DisguiseTarget

# Find the target player
execute store result score #target_found skinwalker.temp run data get storage skinwalker:temp TargetName

# If we found a valid target
execute if score #target_found skinwalker.temp matches 1.. run {
    # Try to copy the target's appearance
    execute store result score #skin_copied skinwalker.temp run identity copy @s @e[type=player,limit=1,sort=nearest,nbt={CustomName:{'text':''}}]
    
    # If we couldn't copy the skin, use a random YouTuber skin
    execute if score #skin_copied skinwalker.temp matches 0 run {
        function skinwalker:skin/set_youtuber_skin
        tellraw @s ["",{"text":"[","color":"dark_aqua"},{"text":"!","color":"aqua","bold":true},{"text":"] ","color":"dark_aqua"},{"text":"Using random YouTuber skin","color":"aqua"}]
    }
    
    # Copy the target's armor and held items
    execute as @e[type=player,limit=1,sort=nearest,nbt={CustomName:{'text':''}}] run {
        # Copy main hand item
        execute if data entity @s SelectedItem run {
            item replace entity @s weapon.mainhand from entity @s weapon.mainhand
        }
        # Copy offhand item
        execute if data entity @s Inventory[{Slot:-106b}] run {
            item replace entity @s weapon.offhand from entity @s weapon.offhand
        }
        # Copy armor
        execute if data entity @s ArmorItems[0] run {
            item replace entity @s armor.feet from entity @s armor.feet
        }
        execute if data entity @s ArmorItems[1] run {
            item replace entity @s armor.legs from entity @s armor.legs
        }
        execute if data entity @s ArmorItems[2] run {
            item replace entity @s armor.chest from entity @s armor.chest
        }
        execute if data entity @s ArmorItems[3] run {
            item replace entity @s armor.head from entity @s armor.head
        }
    }
}

# Visual effects
particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 50
particle minecraft:cloud ~ ~1 ~ 1 2 1 0.1 30
playsound minecraft:entity.evoker.prepare_wololo player @a ~ ~ ~ 1 1
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1

# Notify the Skinwalker
title @s title ["",{"text":"DISGUISE ACTIVE","color":"dark_aqua","bold":true}]
title @s subtitle ["",{"text":"You've taken on a new form!","color":"aqua"}]

# Notify nearby players (except other skinwalkers)
execute at @s run tellraw @a[distance=..15,team=!skinwalker] [
    "",
    {"text":"[","color":"dark_red"},
    {"text":"!","color":"red","bold":true},
    {"text":"] ","color":"dark_red"},
    {"selector":"@s"},
    {"text":" has disguised themselves...","color":"red"}
]

# Schedule the next disguise check
schedule function skinwalker:abilities/disguise/check_disguise_timer 20t
