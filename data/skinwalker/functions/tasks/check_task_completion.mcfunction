# Function: skinwalker:tasks/check_task_completion
# Purpose: Check and update completion status for a player's assigned tasks
# Called for each survivor during the task check phase

# Check if player has already completed all tasks (3 is the max)
execute if score @s skinwalker.tasks matches 3.. run return 0

# Store current task count for comparison
scoreboard players operation #previous_tasks skinwalker.temp = @s skinwalker.tasks

# Check each task type and update completion status
# Only check tasks that are assigned to this player

# Task 1: Mine ores
execute if score @s skinwalker.assigned_task1 matches 1 if score @s skinwalker.task_mine_ores matches 0 run {
    execute if score @s skinwalker.mined_ores matches 10.. run {
        scoreboard players set @s skinwalker.task_mine_ores 1
        scoreboard players add @s skinwalker.tasks 1
        
        # Notify player
        title @s title ["",{"text":"Task Completed!","color":"green"}]
        title @s subtitle ["",{"text":"Mine 10 ores","color":"yellow"}]
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"text":"Mine 10 ores","color":"yellow"}]
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Update task list display
        function skinwalker:tasks/update_task_list
    }
}

# Task 2: Craft items
execute if score @s skinwalker.assigned_task2 matches 1 if score @s skinwalker.task_craft_items matches 0 run {
    execute if score @s skinwalker.crafted_items matches 5.. run {
        scoreboard players set @s skinwalker.task_craft_items 1
        scoreboard players add @s skinwalker.tasks 1
        
        # Notify player
        title @s title ["",{"text":"Task Completed!","color":"green"}]
        title @s subtitle ["",{"text":"Craft 5 items","color":"yellow"}]
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"text":"Craft 5 items","color":"yellow"}]
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Update task list display
        function skinwalker:tasks/update_task_list
    }
}

# Task 3: Kill mobs
execute if score @s skinwalker.assigned_task3 matches 1 if score @s skinwalker.task_kill_mobs matches 0 run {
    execute if score @s skinwalker.killed_mobs matches 10.. run {
        scoreboard players set @s skinwalker.task_kill_mobs 1
        scoreboard players add @s skinwalker.tasks 1
        
        # Notify player
        title @s title ["",{"text":"Task Completed!","color":"green"}]
        title @s subtitle ["",{"text":"Kill 10 mobs","color":"yellow"}]
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"text":"Kill 10 mobs","color":"yellow"}]
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Update task list display
        function skinwalker:tasks/update_task_list
    }
}

# Task 4: Travel distance
execute if score @s skinwalker.assigned_task4 matches 1 if score @s skinwalker.task_travel_distance matches 0 run {
    execute if score @s skinwalker.traveled_blocks matches 1000.. run {
        scoreboard players set @s skinwalker.task_travel_distance 1
        scoreboard players add @s skinwalker.tasks 1
        
        # Notify player
        title @s title ["",{"text":"Task Completed!","color":"green"}]
        title @s subtitle ["",{"text":"Travel 1000 blocks","color":"yellow"}]
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"text":"Travel 1000 blocks","color":"yellow"}]
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Update task list display
        function skinwalker:tasks/update_task_list
    }
}

# Task 5: Build structure
execute if score @s skinwalker.assigned_task5 matches 1 if score @s skinwalker.task_build_structure matches 0 run {
    execute if score @s skinwalker.built_blocks matches 100.. run {
        scoreboard players set @s skinwalker.task_build_structure 1
        scoreboard players add @s skinwalker.tasks 1
        
        # Notify player
        title @s title ["",{"text":"Task Completed!","color":"green"}]
        title @s subtitle ["",{"text":"Build a structure (100+ blocks)","color":"yellow"}]
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"text":"Build a structure (100+ blocks)","color":"yellow"}]
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
        
        # Update task list display
        function skinwalker:tasks/update_task_list
    }
}

# If tasks were completed, update the player's task list
execute unless score @s skinwalker.tasks = #previous_tasks skinwalker.temp run {
    # Additional effects when tasks are completed
    execute at @s run particle minecraft:glow ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force @a
    
    # If all tasks are now complete, handle that
    execute if score @s skinwalker.tasks matches 3 run {
        # Grant rewards or special effects
        effect give @s minecraft:hero_of_the_village 30 1 true
        tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"All tasks completed! ","color":"yellow"},{"text":"Wait for others to finish.","color":"gray"}]
    }
}

# Check if player just completed all tasks
scoreboard players operation #new_tasks skinwalker.temp = @s skinwalker.tasks
scoreboard players operation #new_tasks skinwalker.temp -= #previous_tasks skinwalker.temp

execute if score #new_tasks skinwalker.temp matches 1.. run {
    # Player completed at least one task this check
    
    # Check if they just finished all tasks
    execute if score @s skinwalker.tasks matches 3 run {
        tellraw @a ["",{"text":"[TASK] ","color":"green"},{"selector":"@s"},{"text":" has completed all their tasks!","color":"green"}]
        
        # Give reward
        give @s minecraft:emerald 3
        effect give @s minecraft:speed 300 0 true
        playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 0.8
    }
    
    # Update task tracker
    function skinwalker:tasks/update_task_list
}

# Task 3: Kill mobs
#execute if score @s skinwalker.task_kill_mobs matches 0 if score @s skinwalker.killed_mobs matches 5.. run {
#    scoreboard players set @s skinwalker.task_kill_mobs 1
#    scoreboard players add @s skinwalker.tasks 1
#    tellraw @s ["",{"text":"Task Completed: ","color":"green"},{"text":"Kill 5 mobs","color":"white"}]
#}

# Task 4: Travel distance
#execute if score @s skinwalker.task_travel_distance matches 0 if score @s skinwalker.distance_traveled matches 1000.. run {
#    scoreboard players set @s skinwalker.task_travel_distance 1
#    scoreboard players add @s skinwalker.tasks 1
#    tellraw @s ["",{"text":"Task Completed: ","color":"green"},{"text":"Travel 1000 blocks","color":"white"}]
#}

# Task 5: Build structure
#execute if score @s skinwalker.task_build_structure matches 0 if score @s skinwalker.built_blocks matches 64.. run {
#    scoreboard players set @s skinwalker.task_build_structure 1
#    scoreboard players add @s skinwalker.tasks 1
#    tellraw @s ["",{"text":"Task Completed: ","color":"green"},{"text":"Build a structure (64+ blocks)","color":"white"}]
#}
