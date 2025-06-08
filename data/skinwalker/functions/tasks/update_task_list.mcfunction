# Update player's task list display

# Calculate completed tasks
scoreboard players set #completed skinwalker.temp 0
scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure

# Update task tracker item in inventory
execute as @s[nbt={Inventory:[{id:"minecraft:compass",tag:{display:{Name:'{"text":"Task Tracker"}'}}}]}] run {
    # Remove old task tracker
    clear @s minecraft:compass{display:{Name:'{"text":"Task Tracker"}'}} 1
    
    # Give new task tracker with updated lore
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:[
        '{"text":"Right-click to view tasks","color":"gray"}',
        '{"text":" ","color":"gray"}',
        '{"text":"Completed: ","color":"gray"}{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"}"/3',
        '{"text":" ","color":"gray"}'
    ]},HideFlags:1} 1
}

# Update action bar with task progress
title @s actionbar [
    "",
    {"text":"[","color":"dark_gray"},
    {"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"},
    {"text":"/3","color":"gray"},
    {"text":"] ","color":"dark_gray"},
    {"text":"Tasks Completed","color":"white"}
]

# If all tasks completed, show celebration
execute if score #completed skinwalker.temp matches 3 run {
    title @s times 0 40 10
    title @s title ["",{"text":"ALL TASKS COMPLETED!","color":"green","bold":true}]
    title @s subtitle ["",{"text":"Return to the meeting area!","color":"white"}]
    playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
}
