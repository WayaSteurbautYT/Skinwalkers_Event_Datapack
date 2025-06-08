# Assign a random task to the executing player

# Generate random number 0-9
scoreboard players set #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0
scoreboard players add #random skinwalker.temp 0

# Assign task based on random number
# Each task has a different weight to ensure variety

# Mine Diamond Ore (rare)
execute if score #random skinwalker.temp matches 0 if entity @s[tag=!task_mine_diamond] run {
    tag @s add task_mine_diamond
    scoreboard players set @s skinwalker.task_mine_diamond 0
    scoreboard players set @s skinwalker.task_mine_diamond_required 1
    return 0
}

# Craft Workbench (common)
execute if score #random skinwalker.temp matches 1 if entity @s[tag=!task_craft_workbench] run {
    tag @s add task_craft_workbench
    return 0
}

# Kill Mobs (common)
execute if score #random skinwalker.temp matches 2 if entity @s[tag=!task_kill_mobs] run {
    tag @s add task_kill_mobs
    scoreboard players set @s skinwalker.task_kill_mobs 0
    scoreboard players set @s skinwalker.task_kill_mobs_required 10
    return 0
}

# Eat Food (common)
execute if score #random skinwalker.temp matches 3 if entity @s[tag=!task_eat_food] run {
    tag @s add task_eat_food
    scoreboard players set @s skinwalker.task_eat_food 0
    scoreboard players set @s skinwalker.task_eat_food_required 5
    return 0
}

# Breed Animals (uncommon)
execute if score #random skinwalker.temp matches 4 if entity @s[tag=!task_breed_animals] run {
    tag @s add task_breed_animals
    scoreboard players set @s skinwalker.task_breed_animals 0
    scoreboard players set @s skinwalker.task_breed_animals_required 3
    return 0
}

# Mine Stone (very common)
execute if score #random skinwalker.temp matches 5 if entity @s[tag=!task_mine_stone] run {
    tag @s add task_mine_stone
    scoreboard players set @s skinwalker.task_mine_stone 0
    scoreboard players set @s skinwalker.task_mine_stone_required 32
    return 0
}

# Craft Tools (common)
execute if score #random skinwalker.temp matches 6 if entity @s[tag=!task_craft_tools] run {
    tag @s add task_craft_tools
    scoreboard players set @s skinwalker.task_craft_tools 0
    scoreboard players set @s skinwalker.task_craft_tools_required 3
    return 0
}

# Smelt Iron (uncommon)
execute if score #random skinwalker.temp matches 7 if entity @s[tag=!task_smelt_iron] run {
    tag @s add task_smelt_iron
    scoreboard players set @s skinwalker.task_smelt_iron 0
    scoreboard players set @s skinwalker.task_smelt_iron_required 5
    return 0
}

# Place Blocks (common)
execute if score #random skinwalker.temp matches 8 if entity @s[tag=!task_place_blocks] run {
    tag @s add task_place_blocks
    scoreboard players set @s skinwalker.task_place_blocks 0
    scoreboard players set @s skinwalker.task_place_blocks_required 16
    return 0
}

# Fish (uncommon)
execute if score #random skinwalker.temp matches 9 if entity @s[tag=!task_fish] run {
    tag @s add task_fish
    scoreboard players set @s skinwalker.task_fish 0
    scoreboard players set @s skinwalker.task_fish_required 3
    return 0
}

# If we get here, the selected task was already assigned, try again
function skinwalker:tasks/assign_random_task
