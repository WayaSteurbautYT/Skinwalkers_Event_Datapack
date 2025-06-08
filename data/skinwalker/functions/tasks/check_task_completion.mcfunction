# Function: skinwalker:tasks/check_task_completion
# Purpose: Checks all assigned tasks for the executing player (@s) and updates their completion status.

# --- Task: Mine Diamond Ore ---
execute if entity @s[tag=task_mine_diamond] if score @s skinwalker.task_mine_diamond >= @s skinwalker.task_mine_diamond_required run {
    tag @s remove task_mine_diamond
    # Store task name for messaging, example (not fully implemented parameter passing)
    data modify storage skinwalker:temp current_task_name set value "Mine Diamond Ore"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Craft Workbench ---
# This task is tag-only. Assumes an external trigger (advancement) calls a function that sets a temporary score/tag,
# or directly calls complete_single_task_actions after removing the main task tag.
# For this check, if the tag is present, we assume it's ready to be marked complete IF a separate trigger confirms it.
# This is simplified: a real system would have the advancement trigger remove task_craft_workbench and call complete_single_task_actions.
execute if entity @s[tag=task_craft_workbench] run {
    # Example: Advancement for crafting workbench would run:
    # tag @s[advancements={minecraft:story/smelt_iron=true}] remove task_craft_workbench # Incorrect advancement for example
    # data modify storage skinwalker:temp current_task_name set value "Craft Workbench"
    # function skinwalker:tasks/complete_single_task_actions
    # For now, this check_task_completion won't auto-complete it without a trigger.
}

# --- Task: Kill Mobs ---
execute if entity @s[tag=task_kill_mobs] if score @s skinwalker.task_kill_mobs >= @s skinwalker.task_kill_mobs_required run {
    tag @s remove task_kill_mobs
    data modify storage skinwalker:temp current_task_name set value "Kill Mobs"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Eat Food ---
execute if entity @s[tag=task_eat_food] if score @s skinwalker.task_eat_food >= @s skinwalker.task_eat_food_required run {
    tag @s remove task_eat_food
    data modify storage skinwalker:temp current_task_name set value "Eat Food"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Breed Animals ---
execute if entity @s[tag=task_breed_animals] if score @s skinwalker.task_breed_animals >= @s skinwalker.task_breed_animals_required run {
    tag @s remove task_breed_animals
    data modify storage skinwalker:temp current_task_name set value "Breed Animals"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Mine Stone ---
execute if entity @s[tag=task_mine_stone] if score @s skinwalker.task_mine_stone >= @s skinwalker.task_mine_stone_required run {
    tag @s remove task_mine_stone
    data modify storage skinwalker:temp current_task_name set value "Mine Stone"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Craft Tools ---
execute if entity @s[tag=task_craft_tools] if score @s skinwalker.task_craft_tools >= @s skinwalker.task_craft_tools_required run {
    tag @s remove task_craft_tools
    data modify storage skinwalker:temp current_task_name set value "Craft Tools"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Smelt Iron ---
execute if entity @s[tag=task_smelt_iron] if score @s skinwalker.task_smelt_iron >= @s skinwalker.task_smelt_iron_required run {
    tag @s remove task_smelt_iron
    data modify storage skinwalker:temp current_task_name set value "Smelt Iron Ingots"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Place Blocks ---
execute if entity @s[tag=task_place_blocks] if score @s skinwalker.task_place_blocks >= @s skinwalker.task_place_blocks_required run {
    tag @s remove task_place_blocks
    data modify storage skinwalker:temp current_task_name set value "Place Blocks"
    function skinwalker:tasks/complete_single_task_actions
}

# --- Task: Fish ---
execute if entity @s[tag=task_fish] if score @s skinwalker.task_fish >= @s skinwalker.task_fish_required run {
    tag @s remove task_fish
    data modify storage skinwalker:temp current_task_name set value "Catch Fish"
    function skinwalker:tasks/complete_single_task_actions
}

# After checking all individual tasks, see if the player has completed all their assigned tasks
execute if score @s skinwalker.task_count matches 0 if score @s skinwalker.player_all_tasks_done matches 0 run {
    scoreboard players set @s skinwalker.player_all_tasks_done 1
    
    tellraw @s ["",{"text":"[TASK MASTER] ","color":"gold"},{"text":"You have completed all of your assigned tasks! Great job!","color":"yellow"}]
    tellraw @a [{"selector":"@s","color":"aqua"},{"text":" has completed all their tasks!","color":"green"}]
    playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 1.2
    playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.7 0.8
    
    effect give @s minecraft:hero_of_the_village 60 0 true
    give @s minecraft:emerald 3
}

# Update task list display for the player
function skinwalker:tasks/update_task_list
function skinwalker:gui/update_sidebar
# function skinwalker:gui/update_actionbar
