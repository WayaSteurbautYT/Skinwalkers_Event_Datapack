# Check survivor win condition
# If no survivors left, skinwalkers win

execute unless entity @a[tag=survivor] run {
    # No survivors left, skinwalkers win
    tellraw @a ["",{"text":"=== ","color":"dark_red"},{"text":"GAME OVER","color":"red","bold":true},{"text":" ===\n","color":"dark_red"},{"text":"The Skinwalkers have eliminated all survivors!","color":"gray"}]
    
    title @a title ["",{"text":"SKINWALKERS WIN!","color":"red","bold":true}]
    title @a subtitle ["",{"text":"No survivors remain...","color":"dark_red"}]
    
    # End the game
    function skinwalker:game/end
}
