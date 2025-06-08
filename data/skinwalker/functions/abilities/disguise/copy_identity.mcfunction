# Copy another player's identity

# Get the target from storage
execute store result score #has_target skinwalker.temp run data get storage skinwalker:temp TargetUUID 1

# If we have a valid target, copy their identity
execute if score #has_target skinwalker.temp matches 1.. run {
    # Store the target's UUID
    data modify entity @s DisguiseTarget set from storage skinwalker:temp TargetUUID
    
    # Apply disguise using Identity mod
    execute as @e[type=player] if data entity @s UUID == storage skinwalker:temp TargetUUID run {
        # Copy the target's appearance
        identity copy @s @s
        
        # Store the target's name for later reference
        data modify entity @s DisguiseName set from entity @s CustomName
        
        # Notify the skinwalker
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You have disguised as ","color":"red"},{"storage":"skinwalker:temp","nbt":"TargetName","interpret":true}]
    }
    
    # Visual effects
    particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 50
    playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
    
    # Notify nearby players (except the skinwalker)
    execute at @s run tellraw @a[distance=..15,team=!Skinwalker] ["",{"text":"[WARNING]","color":"red"},{"text":" A Skinwalker has taken on a new form!","color":"white"}]
}
