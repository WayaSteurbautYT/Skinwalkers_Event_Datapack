# Handle disguise selection with validation and cooldown
# This function is called when a Skinwalker right-clicks with the disguise item

execute as @a[tag=skinwalker,tag=!disguised] at @s run {
    # Check if player is in the correct game phase
    execute unless score #game_phase skinwalker.phase matches 1 run {
        title @s title ["",{"text":"UNAVAILABLE","color":"red","bold":true}]
        title @s subtitle ["",{"text":"Disguise is disabled in this phase","color":"red"}]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
        return 0
    }
    
    # Check cooldown first
    execute if score @s skinwalker.disguise_cooldown matches 1.. run {
        # Calculate remaining cooldown in seconds
        scoreboard players operation #cooldown_sec skinwalker.temp = @s skinwalker.disguise_cooldown
        scoreboard players operation #cooldown_sec skinwalker.temp /= 20 const
        
        title @s actionbar [
            "",
            {"text":"[","color":"dark_red"},
            {"text":"!","color":"red","bold":true},
            {"text":"] ","color":"dark_red"},
            {"text":"Disguise on cooldown: ","color":"red"},
            {"score":{"name":"#cooldown_sec","objective":"skinwalker.temp"},"color":"gold"},
            {"text":"s","color":"red"}
        ]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
        return 0
    }
    
    # Check if player is looking at a valid target (max 5 blocks away)
    execute anchored eyes positioned ^ ^ ^0.1 run {
        # Find nearest player within 5 blocks
        execute as @e[type=player,distance=..5,limit=1,sort=nearest] if entity @s[tag=!skinwalker] run {
            # Store target's name for later reference
            data modify storage skinwalker:temp DisguiseTarget set from entity @s CustomName
            
            # Verify target is not a skinwalker and is alive
            execute if entity @s[tag=!skinwalker,tag=!spectator] run {
                # Set initial cooldown (15 seconds)
                scoreboard players operation @s skinwalker.disguise_cooldown = @s skinwalker.disguise_cooldown_max
                
                # Set disguise duration (3 minutes)
                scoreboard players set @s skinwalker.disguise_timer 3600
                
                # Add disguise tag
                tag @s add disguised
                
                # Apply the disguise (copy target's appearance)
                function skinwalker:abilities/disguise/transform_into_player
                
                # Visual and sound effects
                execute at @s run {
                    playsound minecraft:entity.evoker.prepare_wololo player @a ~ ~ ~ 1 1
                    particle minecraft:witch ~ ~1 ~ 0.5 2 0.5 0.1 30
                    particle minecraft:cloud ~ ~1 ~ 1 1 1 0.1 20
                    particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 10
                }
                
                # Notify player
                title @s title ["",{"text":"DISGUISE ACTIVATED","color":"dark_aqua","bold":true}]
                title @s subtitle ["",{"text":"You now appear as ","color":"aqua"},{"selector":"@e[sort=nearest,limit=1]"}]
                
                # Action bar display
                title @s actionbar [
                    "",
                    {"text":"Disguise active! ","color":"dark_aqua"},
                    {"text":"(","color":"gray"},
                    {"text":"Right-click to cancel","color":"gray","italic":true},
                    {"text":")","color":"gray"}
                ]
                
                # Notify nearby players (except skinwalkers)
                execute at @s run tellraw @a[distance=..15,team=!skinwalker] [
                    "",
                    {"text":"[","color":"dark_red"},
                    {"text":"!","color":"red","bold":true},
                    {"text":"] ","color":"dark_red"},
                    {"text":"A Skinwalker has taken on a new form...","color":"red"}
                ]
                
                # Schedule first disguise check
                schedule function skinwalker:abilities/disguise/check_disguise_timer 20t replace
                
                # Play success sound
                playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 1.5
                
                # Exit successfully
                return 1
            }
        }
        
        # If we get here, no valid target was found
        title @s title ["",{"text":"NO TARGET","color":"red","bold":true}]
        title @s subtitle ["",{"text":"Look at a player to disguise as them","color":"red"}]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
        particle minecraft:smoke ~ ~1 ~ 0.5 1 0.5 0.1 10
    }
}

# Clear the temp storage
data remove storage skinwalker:temp DisguiseTarget
