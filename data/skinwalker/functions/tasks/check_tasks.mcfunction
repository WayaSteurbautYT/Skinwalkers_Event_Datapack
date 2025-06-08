# Check for completed tasks

execute as @a[team=Survivor] run function skinwalker:tasks/check_mine_ores
execute as @a[team=Survivor] run function skinwalker:tasks/check_craft_items
execute as @a[team=Survivor] run function skinwalker:tasks/check_kill_mobs
execute as @a[team=Survivor] run function skinwalker:tasks/check_travel_distance
execute as @a[team=Survivor] run function skinwalker:tasks/check_build_structure

# Update task list for all survivors
execute as @a[team=Survivor] run function skinwalker:tasks/update_task_list

# Check win condition
scoreboard players set #completed_tasks skinwalker.tasks 0
execute as @a[team=Survivor] run scoreboard players operation #completed_tasks skinwalker.tasks += @s skinwalker.tasks

# If all tasks are completed, survivors win
execute if score #completed_tasks skinwalker.tasks >= #total_tasks skinwalker.tasks run function skinwalker:survivors_win
