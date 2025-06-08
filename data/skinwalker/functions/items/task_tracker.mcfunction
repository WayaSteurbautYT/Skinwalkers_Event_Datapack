# Task Tracker - Show current tasks

# Calculate completed tasks
scoreboard players set #completed skinwalker.temp 0
scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure

# Show task list in chat
tellraw @s ["",{"text":"=== ","color":"dark_green"},{"text":"YOUR TASKS","color":"green","bold":true},{"text":" ===","color":"dark_green"}]
tellraw @s ["",{"text":"Completed: ","color":"gray"},{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"},{"text":"/5","color":"gray"}]
tellraw @s [""]

# Show each task with status
# Task 1: Mine Ores
execute if score @s skinwalker.task_mine_ores matches 1 run tellraw @s ["  ",{"text":"[X]","color":"dark_green"},{"text":" Mine 10 ores","color":"gray","strikethrough":true}]
execute if score @s skinwalker.task_mine_ores matches 0 run tellraw @s ["  ",{"text":"[ ]","color":"dark_gray"},{"text":" Mine ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.mined_ores"},"color":"yellow"},{"text":"/10 ores","color":"white"}]

# Task 2: Craft Items
execute if score @s skinwalker.task_craft_items matches 1 run tellraw @s ["  ",{"text":"[X]","color":"dark_green"},{"text":" Craft 5 items","color":"gray","strikethrough":true}]
execute if score @s skinwalker.task_craft_items matches 0 run tellraw @s ["  ",{"text":"[ ]","color":"dark_gray"},{"text":" Craft ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.crafted_items"},"color":"yellow"},{"text":"/5 items","color":"white"}]

# Task 3: Kill Mobs
execute if score @s skinwalker.task_kill_mobs matches 1 run tellraw @s ["  ",{"text":"[X]","color":"dark_green"},{"text":" Kill 10 mobs","color":"gray","strikethrough":true}]
execute if score @s skinwalker.task_kill_mobs matches 0 run tellraw @s ["  ",{"text":"[ ]","color":"dark_gray"},{"text":" Kill ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.killed_mobs"},"color":"yellow"},{"text":"/10 mobs","color":"white"}]

# Task 4: Travel Distance
execute if score @s skinwalker.task_travel_distance matches 1 run tellraw @s ["  ",{"text":"[X]","color":"dark_green"},{"text":" Travel 1000 blocks","color":"gray","strikethrough":true}]
execute if score @s skinwalker.task_travel_distance matches 0 run tellraw @s ["  ",{"text":"[ ]","color":"dark_gray"},{"text":" Travel ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.traveled_blocks"},"color":"yellow"},{"text":"/1000 blocks","color":"white"}]

# Task 5: Build Structure
execute if score @s skinwalker.task_build_structure matches 1 run tellraw @s ["  ",{"text":"[X]","color":"dark_green"},{"text":" Build a structure (100+ blocks)","color":"gray","strikethrough":true}]
execute if score @s skinwalker.task_build_structure matches 0 run tellraw @s ["  ",{"text":"[ ]","color":"dark_gray"},{"text":" Build ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.built_blocks"},"color":"yellow"},{"text":"/100 blocks","color":"white"}]

# Show instructions
tellraw @s [""]
tellraw @s ["",{"text":"[i]","color":"gray"},{"text":" Complete all tasks to help your team win!","color":"white"}]
tellraw @s ["",{"text":"[i]","color":"gray"},{"text":" Watch out for ","color":"white"},{"text":"Skinwalkers","color":"red"},{"text":" trying to blend in!","color":"white"}]

# Play sound
playsound minecraft:ui.button.click player @s ~ ~ ~ 1 1

# Update the task tracker item in hand
execute as @s[nbt={SelectedItem:{id:"minecraft:compass"}}] run {
    # Remove old task tracker
    clear @s minecraft:compass{display:{Name:'{"text":"Task Tracker"}'}} 1
    
    # Give new task tracker with updated lore
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:[
        '{"text":"Right-click to view tasks","color":"gray"}',
        '{"text":" ","color":"gray"}',
        '{"text":"Completed: ","color":"gray"}{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"}"/5","color":"gray"}'
    ]},HideFlags:1} 1
}
