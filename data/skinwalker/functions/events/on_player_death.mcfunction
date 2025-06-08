# Handle player death

execute as @e[type=player,tag=!death_handled] at @s run {
    # Mark as handled to prevent multiple triggers
    tag @s add death_handled
    
    # Store if player was disguised
    scoreboard players set #was_disguised skinwalker.temp 0
    execute if entity @s[tag=disguised] run scoreboard players set #was_disguised skinwalker.temp 1
    
    # Store disguise target if needed
    execute if data entity @s DisguiseTarget run {
        data modify storage skinwalker:temp DeathDisguiseTarget set from entity @s DisguiseTarget
        data modify storage skinwalker:temp DeathDisguiseName set from entity @s DisguiseName
    }
    
    # Remove disguise tags and data
    tag @s remove disguised
    tag @s remove disguised_as
    data remove entity @s DisguiseTarget
    data remove entity @s DisguiseName
    
    # Check if player was a survivor or skinwalker
    execute if entity @s[tag=survivor] run {
        # Survivor died
        tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"selector":"@s"},{"text":" was eliminated!","color":"red"}]
        
        # Remove from survivors team
        team leave @s
        tag @s remove survivor
        
        # Check if they were disguised as someone
        execute if score #was_disguised skinwalker.temp matches 1 run {
            # Was a skinwalker in disguise
            tag @s add skinwalker
            team join skinwalkers @s
            
            # Restore disguise data if it existed
            execute if data storage skinwalker:temp DeathDisguiseTarget run {
                data modify entity @s DisguiseTarget set from storage skinwalker:temp DeathDisguiseTarget
                data modify entity @s DisguiseName set from storage skinwalker:temp DeathDisguiseName
            }
            
            # Set skinwalker skin
            function skinwalker:skin/set_skinwalker
            
            # Notify the player
            tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Your true nature has been revealed!","color":"red"}]
            
            # Clear temporary storage
            data remove storage skinwalker:temp DeathDisguiseTarget
            data remove storage skinwalker:temp DeathDisguiseName
        } else {
            # Was a normal survivor
            tellraw @s ["",{"text":"[","color":"gray"},{"text":"i","color":"white"},{"text":"] ","color":"gray"},{"text":"You have been eliminated! Wait for the next round.","color":"gray"}]
        }
    } else execute if entity @s[tag=skinwalker] run {
        # Skinwalker died
        tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"selector":"@s"},{"text":" was defeated!","color":"red"}]
        
        # Remove from skinwalkers team
        team leave @s
        tag @s remove skinwalker
        
        # Reset skin if disguised
        execute if score #was_disguised skinwalker.temp matches 1 run {
            function skinwalker:abilities/disguise/remove_disguise
        }
        
        tellraw @s ["",{"text":"[","color":"gray"},{"text":"i","color":"white"},{"text":"] ","color":"gray"},{"text":"You have been defeated! Wait for the next round.","color":"gray"}]
    }
    
    # Check win conditions
    execute store result score #survivors_alive skinwalker.temp run team list survivors
    execute store result score #skinwalkers_alive skinwalker.temp run team list skinwalkers
    
    # If no survivors left, skinwalkers win
    execute if score #survivors_alive skinwalker.temp matches 0 run {
        function skinwalker:game/end_skinwalkers_win
    }
    
    # If no skinwalkers left, survivors win
    execute if score #skinwalkers_alive skinwalker.temp matches 0 run {
        function skinwalker:game/end_survivors_win
    }
}

# Clear the death handled tag after a short delay
schedule function skinwalker:events/clear_death_tags 1s
