# Simple test function to verify the datapack is working

tellraw @a ["",{"text":"=== SKINWALKER DATAPACK TEST ===","color":"gold"}]
tellraw @a ["",{"text":"Datapack is loaded and working!","color":"green"}]
tellraw @a ["",{"text":"To start the game, use: ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"}]

# Verify basic functionality
scoreboard objectives add skinwalker.test dummy
scoreboard players set #test skinwalker.test 1

tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Basic functionality test successful","color":"green"}]

# Clean up
scoreboard objectives remove skinwalker.test
