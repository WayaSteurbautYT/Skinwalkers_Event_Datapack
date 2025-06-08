# Assign a random task to the executing player
# Uses a counter to prevent infinite loops if all tasks are somehow assigned.

# Attempt to assign a task up to 10 times (number of available tasks)
scoreboard players set #assign_attempt skinwalker.temp 0

# Store player's current task count
scoreboard players operation #current_tasks skinwalker.temp = @s skinwalker.task_count

# Check if player already has max tasks (e.g., 3) - This score needs to be set elsewhere, e.g. setup_tasks
# For now, assuming a max of 3 tasks as an example.
execute if score #current_tasks skinwalker.temp >= 3 run {
    tellraw @s {"text":"You already have the maximum number of tasks.","color":"yellow"}
    return 0
}

# Loop label for retrying task assignment
function skinwalker:tasks/try_assign_task_loop

# Increment attempt counter
scoreboard players add #assign_attempt skinwalker.temp 1
execute if score #assign_attempt skinwalker.temp > 10 run {
    tellraw @s {"text":"Could not assign a new unique task after 10 attempts.","color":"red"}
    return 0
}

# Generate random number 0-9 (inclusive, for 10 tasks)
scoreboard players random #random skinwalker.temp 0 9

# Assign task based on random number
# Calls specific assign_<type>_task functions which handle item giving, books, and messages.

execute if score #random skinwalker.temp matches 0 if entity @s[tag=!task_mine_diamond] run {
    tag @s add task_mine_diamond # Mark task as assigned
    # Specific scores (current/required) will be set by assign_mining_task if it's different from a generic one
    function skinwalker:tasks/assign_mining_task # Example call - assuming this now assigns diamond mining
    scoreboard players add @s skinwalker.task_count 1
    return 1 # Task assigned
}
execute if score #random skinwalker.temp matches 1 if entity @s[tag=!task_craft_workbench] run {
    tag @s add task_craft_workbench
    # Assuming a generic assign_crafting_task that can handle workbench
    function skinwalker:tasks/assign_crafting_task # Example call - needs specific workbench logic
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 2 if entity @s[tag=!task_kill_mobs] run {
    tag @s add task_kill_mobs
    function skinwalker:tasks/assign_combat_task # Example call
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 3 if entity @s[tag=!task_eat_food] run {
    # This task type doesn't have a dedicated assign_X_task file from the ls output.
    # For now, handle it inline or create a new function for it.
    tag @s add task_eat_food
    scoreboard players set @s skinwalker.task_eat_food 0
    scoreboard players set @s skinwalker.task_eat_food_required 5
    tellraw @s [{"text":"[!] New Task: ","color":"white"},{"text":"Eat 5 Food items.","color":"gold"}]
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 4 if entity @s[tag=!task_breed_animals] run {
    tag @s add task_breed_animals
    function skinwalker:tasks/assign_breeding_task
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 5 if entity @s[tag=!task_mine_stone] run {
    tag @s add task_mine_stone
    # This should call assign_mining_task, but assign_mining_task is generic.
    # We might need assign_mining_task to take parameters or have variants.
    # For now, let's assume assign_mining_task is flexible or we make a new one.
    # This example will set it up like the diamond task for now.
    scoreboard players set @s skinwalker.task_mine_stone 0
    scoreboard players set @s skinwalker.task_mine_stone_required 32
    # Ideally, call a function that gives a book and stone pickaxe.
    # function skinwalker:tasks/assign_specific_mining_task type=stone quantity=32
    tellraw @s [{"text":"[!] New Task: ","color":"white"},{"text":"Mine 32 Stone.","color":"gold"}]
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 6 if entity @s[tag=!task_craft_tools] run {
    tag @s add task_craft_tools
    # Similar to crafting workbench, assign_crafting_task needs to be flexible or have variants.
    # function skinwalker:tasks/assign_crafting_task type=tools quantity=3
    scoreboard players set @s skinwalker.task_craft_tools 0
    scoreboard players set @s skinwalker.task_craft_tools_required 3
    tellraw @s [{"text":"[!] New Task: ","color":"white"},{"text":"Craft 3 Tools.","color":"gold"}]
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 7 if entity @s[tag=!task_smelt_iron] run {
    tag @s add task_smelt_iron
    # Needs an assign_smelting_task or similar.
    scoreboard players set @s skinwalker.task_smelt_iron 0
    scoreboard players set @s skinwalker.task_smelt_iron_required 5
    tellraw @s [{"text":"[!] New Task: ","color":"white"},{"text":"Smelt 5 Iron Ingots.","color":"gold"}]
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 8 if entity @s[tag=!task_place_blocks] run {
    tag @s add task_place_blocks
    function skinwalker:tasks/assign_building_task # Example call
    scoreboard players add @s skinwalker.task_count 1
    return 1
}
execute if score #random skinwalker.temp matches 9 if entity @s[tag=!task_fish] run {
    tag @s add task_fish
    function skinwalker:tasks/assign_fishing_task
    scoreboard players add @s skinwalker.task_count 1
    return 1
}

# If task assignment failed (e.g., task already assigned), try again by looping.
function skinwalker:tasks/try_assign_task_loop
