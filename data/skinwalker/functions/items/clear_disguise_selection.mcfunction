# Clear the selecting_disguise tag if the player hasn't made a selection yet

execute as @a[tag=selecting_disguise] run {
    # Check if enough time has passed since the last disguise attempt
    scoreboard players operation #now skinwalker.temp = $time int 1
    scoreboard players operation #time_since_attempt skinwalker.temp = #now skinwalker.temp
    scoreboard players operation #time_since_attempt skinwalker.temp -= @s skinwalker.last_disguise_attempt
    
    # If more than 30 seconds have passed since the attempt
    execute if score #time_since_attempt skinwalker.temp matches 600.. run {
        # Clear the selecting_disguise tag
        tag @s remove selecting_disguise
        
        # Clear any leftover disguise option tags
        tag @s remove disguise_option_*
        
        # Notify the player
        tellraw @s ["",{"text":"[","color":"yellow"},{"text":"!","bold":true},{"text":"] ","color":"yellow"},{"text":"Disguise selection timed out.","color":"yellow"}]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    }
}
