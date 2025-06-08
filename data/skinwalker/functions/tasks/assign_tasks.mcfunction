# Function: skinwalker:tasks/assign_tasks
# Purpose: Assign exactly 3 random tasks to a player
# Called during game initialization or when tasks need to be reassigned

# Reset all task-related scores
scoreboard players set @s skinwalker.tasks 0

# Clear all task assignments
scoreboard players set @s skinwalker.assigned_task1 0
scoreboard players set @s skinwalker.assigned_task2 0
scoreboard players set @s skinwalker.assigned_task3 0
scoreboard players set @s skinwalker.assigned_task4 0
scoreboard players set @s skinwalker.assigned_task5 0

# Clear task completion status
scoreboard players set @s skinwalker.task_mine_ores 0
scoreboard players set @s skinwalker.task_craft_items 0
scoreboard players set @s skinwalker.task_kill_mobs 0
scoreboard players set @s skinwalker.task_travel_distance 0
scoreboard players set @s skinwalker.task_build_structure 0

# Reset notification flag
scoreboard players set @s skinwalker.notified_tasks_complete 0

# Store available tasks (1-5) in storage
data modify storage skinwalker:tasks available_tasks set value [1,2,3,4,5]

# Assign exactly 3 unique tasks
scoreboard players set #tasks_assigned skinwalker.temp 0
scoreboard players set #attempts skinwalker.temp 0

# Loop until we have 3 tasks or run out of attempts
execute unless score #tasks_assigned skinwalker.temp matches 3 if score #attempts skinwalker.temp matches ..20 run {
    # Get a random task from available tasks
    execute store result score #random_index skinwalker.temp run data get storage skinwalker:tasks available_tasks[0]
    
    # Assign the task based on the random number
    execute if score #random_index skinwalker.temp matches 1 run {
        scoreboard players set @s skinwalker.assigned_task1 1
        tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"New Task: ","color":"white"},{"text":"Mine 10 ores","color":"aqua"}]
    }
    
    execute if score #random_index skinwalker.temp matches 2 run {
        scoreboard players set @s skinwalker.assigned_task2 1
        tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"New Task: ","color":"white"},{"text":"Craft 5 items","color":"aqua"}]
    }
    
    execute if score #random_index skinwalker.temp matches 3 run {
        scoreboard players set @s skinwalker.assigned_task3 1
        tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"New Task: ","color":"white"},{"text":"Kill 10 mobs","color":"aqua"}]
    }
    
    execute if score #random_index skinwalker.temp matches 4 run {
        scoreboard players set @s skinwalker.assigned_task4 1
        tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"New Task: ","color":"white"},{"text":"Travel 1000 blocks","color":"aqua"}]
    }
    
    execute if score #random_index skinwalker.temp matches 5 run {
        scoreboard players set @s skinwalker.assigned_task5 1
        tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"New Task: ","color":"white"},{"text":"Build a structure (100+ blocks)","color":"aqua"}]
    }
    
    # Remove the assigned task from available tasks
    data remove storage skinwalker:tasks available_tasks[0]
    
    # Increment counters
    scoreboard players add #tasks_assigned skinwalker.temp 1
    scoreboard players add #attempts skinwalker.temp 1
}

# Update player's task list display
function skinwalker:tasks/update_task_list

# Give the player a task tracker item if they don't have one
execute unless entity @s[nbt={Inventory:[{id:"minecraft:compass"}]}] run {
    give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:['{"text":"Right-click to view tasks","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1
}

# Notify player
tellraw @s ["",{"text":"[TASKS]","color":"green"}," ",{"text":"You've been assigned ","color":"white"},{"score":{"name":"#tasks_assigned","objective":"skinwalker.temp"},"color":"green"},{"text":" tasks. Check your Task Tracker!","color":"white"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
