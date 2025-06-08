# Randomly teleport players to mix things up
# This can separate groups and create tension

# Select a random survivor to teleport
execute as @r[tag=survivor] at @s run {
    # Store original position for message
    execute store result storage skinwalker:temp PosX double 1 run data get entity @s Pos[0]
    execute store result storage skinwalker:temp PosZ double 1 run data get entity @s Pos[2]
    
    # Find a safe location to teleport to
    scoreboard players set #attempts skinwalker.temp 0
    
    # Try up to 10 times to find a safe spot
    execute unless score #attempts skinwalker.temp matches ..10 run {
        # Random offset (20-50 blocks away)
        scoreboard players set #offset skinwalker.temp 20
        scoreboard players add #offset skinwalker.temp 0..30
        
        # Random angle (0-360 degrees)
        scoreboard players set #angle skinwalker.temp 0..359
        
        # Calculate new position
        execute store result score #x skinwalker.temp run scoreboard players get #offset skinwalker.temp
        scoreboard players operation #x skinwalker.temp *= #angle skinwalker.temp
        scoreboard players operation #x skinwalker.temp /= 90 const
        
        execute store result score #z skinwalker.temp run scoreboard players get #offset skinwalker.temp
        scoreboard players operation #z skinwalker.temp *= #angle skinwalker.temp
        scoreboard players add #z skinwalker.temp 90
        scoreboard players operation #z skinwalker.temp %= 360 const
        scoreboard players operation #z skinwalker.temp /= 90 const
        
        # Try to find a safe spot at this location
        execute positioned ~#x ~ ~#z run {
            # Check if this is a safe spot (not in liquid, not in the void, etc.)
            execute if block ~ ~-1 ~ #minecraft:mineable/pickaxe run {
                # Found a safe spot, teleport the player
                tp @s ~ ~ ~
                
                # Play teleport effects
                particle minecraft:portal ~ ~1 ~ 1 2 1 0.1 100 force @s
                playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
                
                # Notify the player
                title @s title ["",{"text":"TELEPORTED!","color":"dark_purple","bold":true}]
                title @s subtitle ["",{"text":"You feel disoriented...","color":"gray"}]
                
                # Stop the loop
                scoreboard players set #attempts skinwalker.temp 100
                
                # Notify other players
                execute as @a[tag=survivor] at @s unless entity @s run {
                    tellraw @s ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple","bold":true},{"text":"] ","color":"dark_purple"},{"selector":"@s","color":"green"},{"text":" was teleported away!","color":"gray"}]
                }
            }
        }
        
        # Increment attempt counter
        scoreboard players add #attempts skinwalker.temp 1
    }
}
