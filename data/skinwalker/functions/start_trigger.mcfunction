# Handle the start trigger

execute as @a[scores={skinwalker_trigger=1..}] run {
    # Reset trigger
    scoreboard players set @s skinwalker_trigger 0
    
    # Check if player has operator permissions
    execute if predicate minecraft:player_has_permission_level:4 run {
        # Start the game
        function skinwalker:game/start
    } else {
        # Notify player they don't have permission
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You must be an operator to start the game!","color":"red"}]
    }
}

# Clear trigger from all players
scoreboard players reset * skinwalker_trigger
