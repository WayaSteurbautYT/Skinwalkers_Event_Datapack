# Show help menu

execute as @s run {
    # Main help message
    tellraw @s ["",{"text":"=== ","color":"dark_gray"},{"text":"Skinwalker Event ","color":"red","bold":true},{"text":"===","color":"dark_gray"}]
    tellraw @s ["",{"text":"Survivors ","color":"green"},{"text":"must complete tasks while identifying the ","color":"white"},{"text":"Skinwalkers","color":"red"}]
    tellraw @s ["",{"text":"Skinwalkers ","color":"red"},{"text":"must eliminate all ","color":"white"},{"text":"Survivors","color":"green"},{"text":" without being caught!","color":"white"}]
    
    # Commands
    tellraw @s ["",{"text":"\nCommands:","color":"gold"}]
    
    # Start command
    tellraw @s ["",{"text":"• ","color":"gray"},{"text":"/trigger skinwalker_start","color":"yellow"},{"text":" - Start the game (OP only)","color":"white"}]
    
    # Info commands
    tellraw @s ["",{"text":"• ","color":"gray"},{"text":"/function skinwalker:help","color":"yellow"},{"text":" - Show this help menu","color":"white"}]
    tellraw @s ["",{"text":"• ","color":"gray"},{"text":"Right-click Task Tracker","color":"yellow"},{"text":" - View your current tasks","color":"white"}]
    
    # Game info
    execute if score #game_phase skinwalker.phase matches 1.. run {
        tellraw @s ["",{"text":"\nGame Status: ","color":"gold"},{"text":"IN PROGRESS","color":"green"}]
        execute if score #game_phase skinwalker.phase matches 1 run tellraw @s ["",{"text":"Current Phase: ","color":"gold"},{"text":"1: Tasks","color":"white"}]
        execute if score #game_phase skinwalker.phase matches 2 run tellraw @s ["",{"text":"Current Phase: ","color":"gold"},{"text":"2: Final Showdown","color":"red"}]
    } else {
        tellraw @s ["",{"text":"\nGame Status: ","color":"gold"},{"text":"NOT STARTED","color":"red"}]
    }
}
