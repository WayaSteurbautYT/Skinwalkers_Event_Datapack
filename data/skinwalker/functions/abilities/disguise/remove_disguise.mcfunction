# Remove a Skinwalker's disguise and reveal their true form
# This can be triggered by the player or when the disguise expires

# Check if player is actually disguised
execute unless entity @s[tag=disguised] run {
    title @s title ["",{"text":"NO DISGUISE","color":"red","bold":true}]
    title @s subtitle ["",{"text":"You are not currently disguised","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Store previous disguise info for messages
data modify storage skinwalker:temp DisguiseName set from entity @s DisguiseName

# Visual and sound effects before removal
execute at @s run {
    # Smoke and magic effects
    particle minecraft:large_smoke ~ ~1 ~ 0.5 2 0.5 0.1 50
    particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 40
    particle minecraft:flash ~ ~1 ~ 1 2 1 0.1 20
    
    # Sound effects
    playsound minecraft:entity.enderman.teleport player @a[distance=..20] ~ ~ ~ 1 0.8
    playsound minecraft:entity.evoker.prepare_wololo player @a[distance=..20] ~ ~ ~ 1 1
    playsound minecraft:entity.ender_dragon.growl player @a[distance=..20] ~ ~ ~ 1 0.5
}

# Remove disguise tags
tag @s remove disguised
tag @s remove disguised_as

# Reset appearance using Identity mod
execute as @s run identity reset @s

# Restore original skin if available
execute if data storage skinwalker:playerdata {UUID: 0} run {
    # Code to restore original skin would go here
    # This would depend on your skin storage system
}

# Notify the player
title @s title ["",{"text":"DISGUISE REMOVED","color":"red","bold":true}]
title @s subtitle ["",{"text":"Your true form is revealed!","color":"red"}]

# Play reveal sound for the player
playsound minecraft:entity.elder_guardian.curse player @s ~ ~ ~ 1 1

# Alert nearby players (except skinwalkers)
execute at @s run {
    tellraw @a[distance=..20,team=!skinwalker] [
        "",
        {"text":"[","color":"dark_red"},
        {"text":"!","color":"red","bold":true},
        {"text":"] ","color":"dark_red"},
        {"selector":"@s"},
        {"text":" has revealed their true form as a ","color":"red"},
        {"text":"SKINWALKER!","color":"dark_red","bold":true}
    ]
    
    # Visual effects for nearby players
    particle minecraft:flash ~ ~1 ~ 1 2 1 0.1 30
    particle minecraft:dust 1 0 0 1 ~ ~1 ~ 0.5 1 0.5 0.1 20
}

# Start cooldown (15 seconds)
scoreboard players operation @s skinwalker.disguise_cooldown = @s skinwalker.disguise_cooldown_max

# Notify about cooldown
title @s title ["",{"text":"DISGUISE COOLDOWN","color":"gold"}]
title @s subtitle ["",{"text":"You can disguise again in 15 seconds","color":"yellow"}]

# Clear any temporary data
data remove entity @s DisguiseTarget
data remove entity @s DisguiseName

# Update action bar
title @s actionbar ["",{"text":"Disguise removed! ","color":"red"},{"text":"Cooldown: ","color":"gray"},{"text":"15s","color":"gold"}]

# Log the action in console
tellraw @a[tag=op] ["",{"text":"[","color":"dark_gray"},{"text":"Skinwalker","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"selector":"@s"},{"text":" removed their disguise","color":"gray"}]
