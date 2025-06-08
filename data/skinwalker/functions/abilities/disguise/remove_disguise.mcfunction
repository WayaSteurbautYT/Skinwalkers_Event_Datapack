# Remove a Skinwalker's disguise and reveal their true form
# This can be triggered by the player or when the disguise expires

# Check if player is actually disguised
execute unless entity @s[tag=disguised] run {
    title @s title ["",{"text":"NO DISGUISE","color":"red","bold":true}]
    title @s subtitle ["",{"text":"You are not currently disguised","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Store previous disguise info (name of player they were disguised as) for messages
# This NBT tag "DisguisedAsName" should have been set on the skinwalker during copy_identity
data modify storage skinwalker:temp TempDisguisedAsName set from entity @s DisguisedAsName

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
execute as @s run identity reset @s # This should reset skin and potentially nameplate

# Explicitly remove/reset CustomName and visibility, just in case 'identity reset' doesn't fully handle it
data remove entity @s CustomName
data modify entity @s CustomNameVisible set value 0b

# Restore original skin if available - This section seems like a placeholder for a different skin system.
# The 'identity reset @s' should be the primary mechanism.
# execute if data storage skinwalker:playerdata {UUID: 0} run {
    # Code to restore original skin would go here
    # This would depend on your skin storage system
# }

# Notify the player
title @s title ["",{"text":"DISGUISE REMOVED","color":"red","bold":true}]
title @s subtitle ["",{"text":"Your true form is revealed!","color":"red"}]

# Play reveal sound for the player
playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 1

# Alert nearby players (except skinwalkers)
execute at @s run {
    tellraw @a[distance=..20,team=!Skinwalker,tag=!skinwalker] [ # Ensure not to message other skinwalkers if team check fails
        "",
        {"text":"[","color":"dark_red"},
        {"text":"!","color":"red","bold":true},
        {"text":"] ","color":"dark_red"},
        {"storage":"skinwalker:temp","nbt":"TempDisguisedAsName","color":"yellow","interpret":true}, # Show who they were disguised as
        {"text":" has revealed their true form as a ","color":"red"},
        {"text":"SKINWALKER!","color":"dark_red","bold":true,"italic":true}
    ]
    
    # Visual effects for nearby players
    particle minecraft:explosion ~ ~1 ~ 0.1 0.1 0.1 0.5 5
    particle minecraft:flame ~ ~1 ~ 0.5 1 0.5 0.05 100
}

# Cooldown is handled by the 'use' function. No cooldown setting here.
# scoreboard players operation @s skinwalker.disguise_cooldown = @s skinwalker.disguise_cooldown_max
# title @s title ["",{"text":"DISGUISE COOLDOWN","color":"gold"}]
# title @s subtitle ["",{"text":"You can disguise again in 15 seconds","color":"yellow"}]

# Clear the stored name of who they were disguised as from their NBT
data remove entity @s DisguisedAsName
# Clear temp storage used for messaging
data remove storage skinwalker:temp TempDisguisedAsName


# Update action bar
title @s actionbar ["",{"text":"Disguise removed! ","color":"red"},{"text":"Cooldown: ","color":"gray"},{"text":"15s","color":"gold"}]

# Log the action in console
tellraw @a[tag=op] ["",{"text":"[","color":"dark_gray"},{"text":"Skinwalker","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"selector":"@s"},{"text":" removed their disguise","color":"gray"}]

# --- Appended General Reset Commands ---
# Attempt to clear skin from URL (e.g., for SkinsRestorer)
skin clear @s

# Attempt to unequip mob form (e.g., for Identity or LibsDisguises)
identity unequip @s
# LibsDisguises might use: /undisguise @s

# Ensure specific disguise type tags are removed
tag @s remove disguised_as_player
tag @s remove disguised_as_mob

# General 'disguised' tag and 'DisguisedAsName' NBT are already handled above.
# CustomName and CustomNameVisible are also already handled above.

# Final message, can be redundant if other messages are shown, but good as a catch-all.
# tellraw @s {"text":"You have returned to your true form.","color":"yellow"}
# The existing "DISGUISE REMOVED" title is probably sufficient.
