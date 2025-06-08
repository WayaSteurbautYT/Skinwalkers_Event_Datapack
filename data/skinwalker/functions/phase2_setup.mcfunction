# Phase 2: Final Showdown Setup

# Set the phase
scoreboard players set #phase skinwalker.phase 2

# Set the time to night and weather to thunder for atmosphere
time set 18000
weather thunder

# Announce phase transition
title @a title ["",{"text":"PHASE 2: FINAL SHOWDOWN","color":"red","bold":true}]
title @a subtitle ["",{"text":"The Skinwalkers' true forms are revealed!","color":"white"}]

# Play dramatic sound effect
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1

# Notify all players
tellraw @a ["",{"text":"=== ","color":"red"},{"text":"PHASE 2: FINAL SHOWDOWN","color":"red","bold":true},{"text":" ===\n","color":"red"},{"text":"Survivors: Complete the final task!\nSkinwalkers: Eliminate all survivors!","color":"white"}]

# Reset phase timer for phase 2 (3 minutes)
scoreboard players set #phase_timer skinwalker.temp 0

# Remove all disguises from skinwalkers and disable disguise ability
execute as @a[tag=skinwalker] run {
    # Remove any active disguises
    execute if entity @s[tag=disguised] run {
        function skinwalker:abilities/disguise/remove_disguise
        
        # Notify the player
        title @s title ["",{"text":"DISGUISE LOST","color":"red","bold":true}]
        title @s subtitle ["",{"text":"Your disguise has been revealed!","color":"dark_red"}]
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Your disguise has been revealed to all players!","color":"red"}]
    }
    
    # Clear any disguise cooldowns or timers
    scoreboard players set @s skinwalker.ability_cooldown 0
    scoreboard players set @s skinwalker.ability_duration 0
    
    # Clear any disguise-related tags and data
    tag @s remove disguised
    tag @s remove disguised_as
    data remove entity @s DisguiseTarget
    data remove entity @s DisguiseName
    
    # Give combat abilities
    effect give @s minecraft:strength 1000000 0 true
    effect give @s minecraft:speed 1000000 1 true
    effect give @s minecraft:resistance 1000000 0 true
    
    # Give combat items
    give @s minecraft:iron_sword{Enchantments:[{id:sharpness,lvl:2},{id:knockback,lvl:1}]} 1
    give @s minecraft:iron_helmet{Enchantments:[{id:protection,lvl:2}]} 1
    give @s minecraft:iron_chestplate{Enchantments:[{id:protection,lvl:2}]} 1
    give @s minecraft:iron_leggings{Enchantments:[{id:protection,lvl:2}]} 1
    give @s minecraft:iron_boots{Enchantments:[{id:protection,lvl:2},{id:feather_falling,lvl:2}]} 1
    
    # Set health to full and add absorption
    effect give @s minecraft:instant_health 1 255 true
    effect give @s minecraft:absorption 1000000 0 true
    
    # Notify player
    title @s title ["",{"text":"YOUR TRUE FORM IS REVEALED!","color":"dark_red","bold":true}]
    title @s subtitle ["",{"text":"Hunt down the survivors!","color":"red"}]
    
    # Play sound effect
    playsound minecraft:entity.ender_dragon.growl player @s ~ ~ ~ 1 1
    
    # Visual effects
    particle minecraft:explosion_emitter ~ ~1 ~ 1 2 1 0.1 20
    
    # Notify all players
    execute as @a run {
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"selector":"@s"},{"text":" has revealed their true form as a ","color":"red"},{"text":"Skinwalker!","color":"dark_red","bold":true}]
    }
}

# Give survivors combat gear
execute as @a[tag=survivor] run {
    # Give combat items
    give @s minecraft:iron_sword{Enchantments:[{id:sharpness,lvl:1}]} 1
    give @s minecraft:shield 1
    give @s minecraft:bow 1
    give @s minecraft:arrow 32
    give @s minecraft:iron_helmet 1
    give @s minecraft:iron_chestplate 1
    give @s minecraft:iron_leggings 1
    give @s minecraft:iron_boots 1
    
    # Give some healing items
    give @s minecraft:golden_apple 3
    give @s minecraft:cooked_beef 16
    
    # Set health to full
    effect give @s minecraft:instant_health 1 255 true
    
    # Notify player
    title @s title ["",{"text":"FINAL SHOWDOWN!","color":"gold","bold":true}]
    title @s subtitle ["",{"text":"Survive the night and defeat the Skinwalkers!","color":"yellow"}]
}

# Set world border to prevent running away
worldborder set 100 30
worldborder damage amount 1
worldborder damage buffer 2

# Enable PvP
gamerule pvp true

# Start the phase 2 loop
function skinwalker:phase2_loop
