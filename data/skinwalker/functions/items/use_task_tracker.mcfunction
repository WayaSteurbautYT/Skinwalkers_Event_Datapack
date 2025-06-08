# Handle right-click with Task Tracker
# This is triggered when a player right-clicks with the Task Tracker compass

execute as @s[tag=survivor] run {
    # Show task list in chat
    tellraw @s ["",{"text":"\n=== YOUR TASKS ===","color":"gold","bold":true}]
    
    # Task 1: Mine ores
    execute if score @s skinwalker.task_mine_ores matches 1 run tellraw @s ["",{"text":"✓ ","color":"green"},{"text":"Mine 10 ores","color":"gray","strikethrough":true}]
    execute if score @s skinwalker.task_mine_ores matches 0 run tellraw @s ["",{"text":"☐ ","color":"yellow"},{"text":"Mine ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.mined_ores"},"color":"aqua"},"/10 ores"]
    
    # Task 2: Craft items
    execute if score @s skinwalker.task_craft_items matches 1 run tellraw @s ["",{"text":"✓ ","color":"green"},{"text":"Craft 5 items","color":"gray","strikethrough":true}]
    execute if score @s skinwalker.task_craft_items matches 0 run tellraw @s ["",{"text":"☐ ","color":"yellow"},{"text":"Craft ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.crafted_items"},"color":"aqua"},"/5 items"]
    
    # Task 3: Kill mobs
    execute if score @s skinwalker.task_kill_mobs matches 1 run tellraw @s ["",{"text":"✓ ","color":"green"},{"text":"Kill 10 mobs","color":"gray","strikethrough":true}]
    execute if score @s skinwalker.task_kill_mobs matches 0 run tellraw @s ["",{"text":"☐ ","color":"yellow"},{"text":"Kill ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.killed_mobs"},"color":"aqua"},"/10 mobs"]
    
    # Task 4: Travel distance
    execute if score @s skinwalker.task_travel_distance matches 1 run tellraw @s ["",{"text":"✓ ","color":"green"},{"text":"Travel 1000 blocks","color":"gray","strikethrough":true}]
    execute if score @s skinwalker.task_travel_distance matches 0 run tellraw @s ["",{"text":"☐ ","color":"yellow"},{"text":"Travel ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.traveled_blocks"},"color":"aqua"},"/1000 blocks"]
    
    # Task 5: Build structure
    execute if score @s skinwalker.task_build_structure matches 1 run tellraw @s ["",{"text":"✓ ","color":"green"},{"text":"Build structure (100+ blocks)","color":"gray","strikethrough":true}]
    execute if score @s skinwalker.task_build_structure matches 0 run tellraw @s ["",{"text":"☐ ","color":"yellow"},{"text":"Build ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.built_blocks"},"color":"aqua"},"/100 blocks"]
    
    # Calculate completed tasks
    scoreboard players set #completed skinwalker.temp 0
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure
    
    # Show progress
    tellraw @s ["",{"text":"\nProgress: ","color":"gray"},{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"},"/3 tasks completed"]
    
    # Play sound
    playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1
}

# If not a survivor, show error
execute as @s[tag=!survivor] run tellraw @s ["",{"text":"[ERROR]","color":"red"}," ",{"text":"Only survivors can use the Task Tracker!","color":"white"}]
