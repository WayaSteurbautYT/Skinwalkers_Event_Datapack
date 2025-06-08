# Assign initial tasks to all survivors with balanced objectives
# This function runs at the start of Phase 1

# Clear any existing tasks and reset progress
execute as @a[tag=survivor] run {
    # Reset task progress
    scoreboard players set @s skinwalker.tasks_completed 0
    scoreboard players set @s skinwalker.tasks_total 5
    
    # Reset all possible task scores
    scoreboard players set @s skinwalker.task_mine_ores 0
    scoreboard players set @s skinwalker.task_craft_items 0
    scoreboard players set @s skinwalker.task_kill_mobs 0
    scoreboard players set @s skinwalker.task_travel_distance 0
    scoreboard players set @s skinwalker.task_build_structure 0
    scoreboard players set @s skinwalker.task_breed_animals 0
    scoreboard players set @s skinwalker.task_fish_items 0
    scoreboard players set @s skinwalker.task_enchant_items 0
    
    # Store player's starting position for travel distance task
    execute store result score @s skinwalker.start_x run data get entity @s Pos[0]
    execute store result score @s skinwalker.start_z run data get entity @s Pos[2]
    
    # Store current time for time-based tasks
    scoreboard players operation @s skinwalker.start_time = #time skinwalker.temp
    
    # Give each player a unique set of 5 random tasks
    scoreboard players set @s skinwalker.task_seed 0
    scoreboard players set @s skinwalker.task_count 0
    
    # Generate a unique seed for this player based on their UUID
    execute store result score @s skinwalker.task_seed run data get entity @s UUID[0]
    
    # Assign tasks based on the seed
    scoreboard players operation #temp skinwalker.temp = @s skinwalker.task_seed
    scoreboard players operation #temp skinwalker.temp %= 7 const
    
    # Assign tasks in a loop until we have 5
    execute if score @s skinwalker.task_count matches 0..4 run function skinwalker:tasks/assign_next_task
}

# Give players their task book
give @a[tag=survivor] written_book{
    pages:[
        '{"text":"Survivor Tasks\n\nComplete these objectives to help your team win!\n\n1. Mine 32 ores (0/32)\n2. Craft 16 items (0/16)\n3. Kill 10 hostile mobs (0/10)","color":"black"}',
        '{"text":"4. Travel 500 blocks (0/500)\n5. Build a structure (0/1)\n\nProgress is tracked automatically. Check your scoreboard for updates!","color":"black"}'
    ],
    title:"Survival Guide",
    author:"Skinwalker Event",
    display:{Lore:['{"text":"Complete all tasks to help your team win!","color":"gray","italic":true}']}
} 1

# Notify players
title @a[tag=survivor] title ["",{"text":"TASKS ASSIGNED","color":"green","bold":true}]
title @a[tag=survivor] subtitle ["",{"text":"Check your inventory for the Survival Guide","color":"white"}]
playsound minecraft:ui.toast.challenge_complete master @a[tag=survivor] ~ ~ ~ 1 1

# Give a compass to track objectives
give @a[tag=survivor] minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:32} 1

tellraw @a[tag=survivor] ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"You've been assigned 5 tasks. Complete them all to help your team win!","color":"white"}]

# Start checking for task completion
schedule function skinwalker:phase1/check_tasks 10s replace
