# Handle player respawning

# Check if player is in spectator mode and has a role
scoreboard players set #has_role skinwalker.temp 0
execute if entity @s[tag=survivor] run scoreboard players set #has_role skinwalker.temp 1
execute if entity @s[tag=skinwalker] run scoreboard players set #has_role skinwalker.temp 1
execute if entity @s[tag=youtuber] run scoreboard players set #has_role skinwalker.temp 1

execute if score #has_role skinwalker.temp matches 1 run {
    # Set gamemode back to survival
    gamemode survival @s
    
    # Clear effects
    effect clear @s
    
    # Teleport to a safe location (you might want to implement a spawn point system)
    # For now, teleport to world spawn
    spawnpoint @s ~ ~ ~
    tp @s ~ ~ ~
    
    # Give appropriate items based on role
    execute if entity @s[tag=survivor] run function skinwalker:roles/give_survivor_items
    execute if entity @s[tag=skinwalker] run function skinwalker:roles/give_skinwalker_items
    execute if entity @s[tag=youtuber] run function skinwalker:roles/give_youtuber_items
    
    # Apply appropriate effects
    execute if entity @s[tag=survivor] run effect give @s minecraft:resistance 10 0 true
    execute if entity @s[tag=skinwalker] run effect give @s minecraft:speed 10 1 true
    execute if entity @s[tag=youtuber] run effect give @s minecraft:jump_boost 10 1 true
    
    # Notify player
    title @s title ["",{"text":"RESPAWNED","color":"yellow"}]
    title @s subtitle ["",{"text":"Be more careful next time!","color":"gray"}]
    
    # Play respawn sound
    playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
}

# If no role, set to adventure mode to prevent breaking blocks
execute if score #has_role skinwalker.temp matches 0 run gamemode adventure @s
