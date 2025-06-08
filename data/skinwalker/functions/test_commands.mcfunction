# Test commands for the Skinwalker datapack

# Display all available commands
tellraw @s ["",{"text":"=== ","color":"gold"},{"text":"SKINWALKER TEST COMMANDS","color":"yellow","bold":true},{"text":" ===","color":"gold"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":" - Start the game with auto role assignment","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:test_solo","color":"yellow"},{"text":" - Test solo mode (YouTuber)","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:test_duo","color":"yellow"},{"text":" - Test 2-player mode (1v1)","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:test_trio","color":"yellow"},{"text":" - Test 3-player mode (1v1v1)","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:test_squad","color":"yellow"},{"text":" - Test 4-player mode","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:reset_world","color":"yellow"},{"text":" - Reset the world","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:give_skinwalker_items","color":"yellow"},{"text":" - Give Skinwalker items","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:give_survivor_items","color":"yellow"},{"text":" - Give Survivor items","color":"gray"}]

tellraw @s ["\n",{"text":"=== ","color":"gold"},{"text":"PHASE CONTROLS","color":"yellow","bold":true},{"text":" ===","color":"gold"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:phase1/start","color":"yellow"},{"text":" - Start Phase 1 (Survival)","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:phase2/start","color":"yellow"},{"text":" - Start Phase 2 (Hunt)","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"/function skinwalker:phase3/start","color":"yellow"},{"text":" - Start Phase 3 (Finale)","color":"gray"}]

# Show current game state
tellraw @s ["\n",{"text":"=== ","color":"gold"},{"text":"GAME STATE","color":"yellow","bold":true},{"text":" ===","color":"gold"}]

execute store result score #current_phase skinwalker.phase run scoreboard players get #phase skinwalker.phase
tellraw @s ["",{"text":"Current Phase: ","color":"gray"},{"score":{"name":"#current_phase","objective":"skinwalker.phase"},"color":"yellow"}]

# Show player count
execute store result score #total_players skinwalker.role run scoreboard players get #playerCount playerCount
tellraw @s ["",{"text":"Players: ","color":"gray"},{"score":{"name":"#total_players","objective":"skinwalker.role"},"color":"white"}]

# Show team counts
execute store result score #survivors skinwalker.role run team list Survivor
execute store result score #skinwalkers skinwalker.role run team list Skinwalker
execute store result score #youtubers skinwalker.role run team list YouTuber
tellraw @s ["",{"text":"Team Counts:","color":"gray"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"Survivors: ","color":"green"},{"score":{"name":"#survivors","objective":"skinwalker.role"},"color":"white"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"Skinwalkers: ","color":"red"},{"score":{"name":"#skinwalkers","objective":"skinwalker.role"},"color":"white"}]
tellraw @s ["",{"text":"- ","color":"gray"},{"text":"YouTubers: ","color":"blue"},{"score":{"name":"#youtubers","objective":"skinwalker.role"},"color":"white"}]
