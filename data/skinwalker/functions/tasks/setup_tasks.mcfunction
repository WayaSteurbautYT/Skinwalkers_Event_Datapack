# Initialize tasks for all players

# Set total number of tasks based on player count
scoreboard players set #total_tasks skinwalker.tasks_total 5
execute if score #playerCount playerCount >= 5 run scoreboard players set #total_tasks skinwalker.tasks_total 7
execute if score #playerCount playerCount >= 8 run scoreboard players set #total_tasks skinwalker.tasks_total 10

# Reset completed tasks counter
scoreboard players set #tasks_completed skinwalker.tasks_completed 0

# Assign random tasks to each player
execute as @a[tag=!skinwalker] run {
    # Clear previous tasks
    scoreboard players set @s skinwalker.tasks_completed 0
    
    # Give 1-3 tasks per player (more for smaller games, fewer for larger ones)
    scoreboard players set #tasks_to_assign skinwalker.temp 3
    execute if score #playerCount playerCount >= 5 run scoreboard players set #tasks_to_assign skinwalker.temp 2
    execute if score #playerCount playerCount >= 8 run scoreboard players set #tasks_to_assign skinwalker.temp 1
    
    # Assign random tasks
    execute if score #tasks_to_assign skinwalker.temp matches 1 run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign skinwalker.temp matches 2 run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign skinwalker.temp matches 2 run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign skinwalker.temp matches 3 run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign skinwalker.temp matches 3 run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign skinwalker.temp matches 3 run function skinwalker:tasks/assign_random_task
    
    # Notify player of their tasks
    tellraw @s ["",{"text":"\n=== ","color":"gold"},{"text":"YOUR TASKS","color":"green","bold":true},{"text":" ===","color":"gold"}]
    
    # Display tasks in chat
    execute if entity @s[tag=task_mine_diamond] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Mine ","color":"white"},{"text":"Diamond Ore","color":"aqua"}]
    execute if entity @s[tag=task_craft_workbench] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Craft a ","color":"white"},{"text":"Crafting Table","color":"gold"}]
    execute if entity @s[task_kill_mobs] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Kill ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_kill_mobs"},"color":"red"},{"text":" Mobs","color":"white"}]
    execute if entity @s[tag=task_eat_food] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Eat ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_eat_food"},"color":"gold"},{"text":" Food Items","color":"white"}]
    execute if entity @s[tag=task_breed_animals] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Breed ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_breed_animals"},"color":"gold"},{"text":" Animals","color":"white"}]
    execute if entity @s[tag=task_mine_stone] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Mine ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_mine_stone"},"color":"gray"},{"text":" Stone","color":"white"}]
    execute if entity @s[tag=task_craft_tools] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Craft ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_craft_tools"},"color":"yellow"},{"text":" Tools","color":"white"}]
    execute if entity @s[tag=task_smelt_iron] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Smelt ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_smelt_iron"},"color":"white"},{"text":" Iron Ingots","color":"white"}]
    execute if entity @s[tag=task_place_blocks] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Place ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_place_blocks"},"color":"yellow"},{"text":" Blocks","color":"white"}]
    execute if entity @s[tag=task_fish] run tellraw @s ["",{"text":"• ","color":"yellow"},{"text":"Catch ","color":"white"},{"score":{"name":"@s","objective":"skinwalker.task_fish"},"color":"aqua"},{"text":" Fish","color":"white"}]
    
    # Play task received sound
    playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
}

# Update scoreboard with total tasks
scoreboard players operation #tasks_completed skinwalker.tasks_completed = @a[tag=!skinwalker] skinwalker.tasks_completed
