# Function: skinwalker:tasks/complete_single_task_actions
# Purpose: Common actions executed when a player (@s) completes any single task.
# Relies on the specific task tag having already been removed by the caller,
# and 'storage skinwalker:temp current_task_name' being set for messaging.

# Increment player's personal count of completed tasks
scoreboard players add @s skinwalker.player_tasks_completed_count 1

# Decrement player's active task count
scoreboard players remove @s skinwalker.task_count 1

# Increment global counter for total tasks completed by anyone (for phase transitions)
scoreboard players add #tasks_completed_globally skinwalker.tasks_completed 1

# Notify player of specific task completion
# Using the task name from storage
tellraw @s ["",{"text":"[TASK] ","color":"green"},{"text":"Completed: ","color":"white"},{"nbt":"current_task_name","storage":"skinwalker:temp","color":"yellow"}]
title @s title ["",{"text":"Task Completed!","color":"green"}]
title @s subtitle {"nbt":"current_task_name","storage":"skinwalker:temp","color":"yellow"}
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2

# Optional: particle effect or other immediate reward
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.05 50 force @s

# The calling function (check_task_completion) will handle UI updates like task list/sidebar
# and checking if ALL personal tasks are done.
