# Start a new game

# First, reset everything
function skinwalker:game/reset

# Wait 3 seconds for reset to complete
schedule function skinwalker:game/start_phase1 3s

# Send starting message
title @a title ["",{"text":"STARTING NEW GAME","color":"green","bold":true}]
title @a subtitle ["",{"text":"Preparing the world...","color":"white"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1

tag @a add in_game

execute as @a run {
    # Teleport to spawn or random location
    spreadplayers ~ ~ 50 100 false @s
    
    # Clear inventory just in case
    clear @s
    
    # Set game mode to adventure
    gamemode adventure @s
    
    # Set health and hunger
    effect give @s minecraft:instant_health 1 1 true
    effect give @s minecraft:saturation 1 10 true
}
