# Function: skinwalker:items/use_adrenaline_shot
# Purpose: Activated when a Survivor uses an Adrenaline Shot item.
# Item NBT: minecraft:potion{CustomModelData:3001}

# Ensure the player is a Survivor (or YouTuber, who might also use it)
execute unless entity @s[tag=survivor,tag=youtuber] run {
    # Optional: message if non-survivor tries to use it, though they shouldn't have it.
    tellraw @s {"text":"This item is for Survivors.","color":"red"}
    # Return item if it was taken by a non-survivor somehow - Updated lore to reflect Speed Boost only
    give @s minecraft:potion{CustomModelData:3001,display:{Name:'{"text":"Adrenaline Shot","color":"aqua","italic":false}',Lore:['{"text":"Grants a quick burst of speed.","color":"gray"}','{"text":"Single use. Be wise.","color":"dark_gray"}]}} 1
    return 0
}

# --- Apply Effects ---
# Behavior adjusted to be a "Speed Boost" as per subtask instructions. Regeneration removed.
# Speed II for 7 seconds (140 ticks)
effect give @s minecraft:speed 7 1 true
# Regeneration I for 5 seconds (100 ticks) - REMOVED
# effect give @s minecraft:regeneration 5 0 true

# --- Audiovisual Cues ---
# Sound for using the shot
playsound minecraft:item.bottle.empty master @s ~ ~ ~ 1 1.1 # Sound of using a bottle/potion
playsound minecraft:entity.generic.drink master @s ~ ~ ~ 1 0.9
playsound minecraft:entity.zombie.infect master @s ~ ~ ~ 0.5 1.5 # A subtle "power-up" sound

# Particle effects
particle minecraft:crit ~ ~0.5 ~ 0.3 0.5 0.3 0.1 20
particle minecraft:composter ~ ~1 ~ 0.3 0.5 0.3 0.2 15 # "Green sparks" for vitality

# --- Consume Item & Feedback ---
# This is a single-use item, so clear it.
clear @s minecraft:potion{CustomModelData:3001} 1

tellraw @s ["",{"text":"[ITEM] ","color":"aqua"},{"text":"You used the ","color":"white"},{"text":"Adrenaline Shot","color":"aqua"},{"text":"! Speed boost activated!","color":"white"}]
title @s actionbar {"text":"Adrenaline Rush! Speed active!","color":"aqua"}

# Tag player as having used the shot, for GUI purposes
tag @s add used_adrenaline_shot

# No cooldown score set here as it's single use.
# If it were reusable, we'd set @s skinwalker.adrenaline_cooldown here.
