# Check skinwalker win condition
# If no skinwalkers left, survivors win

execute unless entity @a[tag=skinwalker] run {
    # No skinwalkers left, survivors win
    tellraw @a ["",{"text":"=== ","color":"dark_green"},{"text":"VICTORY!","color":"green","bold":true},{"text":" ===\n","color":"dark_green"},{"text":"The survivors have defeated all the Skinwalkers!","color":"gray"}]
    
    title @a title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
    title @a subtitle ["",{"text":"The Skinwalkers have been defeated!","color":"dark_green"}]
    
    # End the game
    function skinwalker:game/end
}
