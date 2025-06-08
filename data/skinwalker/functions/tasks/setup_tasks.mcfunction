# Initialize tasks for all non-skinwalker players

# Set overall number of tasks to be completed for the game (influences phase transition)
# This is a global target, not per player.
# Example: 5 tasks total for the team to complete. This needs adjustment based on design.
scoreboard players set #total_tasks_needed skinwalker.tasks_total 5
execute if score #playerCount playerCount matches 2..3 run scoreboard players set #total_tasks_needed skinwalker.tasks_total 8
execute if score #playerCount playerCount matches 4.. run scoreboard players set #total_tasks_needed skinwalker.tasks_total 10

# Reset global completed tasks counter (tracks total tasks completed by all players)
scoreboard players set #tasks_completed_globally skinwalker.tasks_completed 0

# Assign tasks to each non-skinwalker player
execute as @a[tag=!skinwalker] run {
    # Initialize player's personal task count
    scoreboard players set @s skinwalker.task_count 0
    # Initialize player's completed task count (how many of their assigned tasks they've done)
    scoreboard players set @s skinwalker.player_tasks_completed 0
    
    # Determine number of tasks to assign to this player (e.g., 2-3)
    scoreboard players set #tasks_to_assign_per_player skinwalker.temp 2
    # Could add logic here for #playerCount to vary tasks_to_assign_per_player
    # Example: if #playerCount playerCount matches 1 run scoreboard players set #tasks_to_assign_per_player skinwalker.temp 3 # Solo player gets more

    # Loop to assign desired number of tasks to the player
    # This requires assign_random_task to correctly handle not assigning duplicates
    # and to stop if max personal tasks are reached, or no more unique tasks can be found.
    # assign_random_task now has a loop with 10 attempts.
    execute if score #tasks_to_assign_per_player skinwalker.temp matches 1.. run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign_per_player skinwalker.temp matches 2.. run function skinwalker:tasks/assign_random_task
    execute if score #tasks_to_assign_per_player skinwalker.temp matches 3.. run function skinwalker:tasks/assign_random_task
    # Max 3 tasks per player with this setup.
    
    # Notify player of their tasks (initial list)
    # The individual assign_X_task functions are now expected to give detailed task info (books, popups).
    # This is a general notification that task assignment is done for them.
    tellraw @s ["",{"text":"\n=== ","color":"gold"},{"text":"YOUR TASKS HAVE BEEN ASSIGNED","color":"green","bold":true},{"text":" ===","color":"gold"}]
    tellraw @s {"text":"Check your inventory for Task Books and look for pop-up messages.","color":"gray"}
}

# The old global #tasks_completed summation was flawed.
# True global progress needs a different approach:
# 1. Each player has a 'skinwalker.player_tasks_completed' score (0 or 1 if all their personal tasks are done).
# 2. A function run by the game loop would sum these up:
#    scoreboard players set #all_players_finished_personal_tasks skinwalker.temp 0
#    execute as @a[tag=!skinwalker] if score @s skinwalker.player_tasks_completed matches 1 run scoreboard players add #all_players_finished_personal_tasks skinwalker.temp 1
# This #all_players_finished_personal_tasks can then be compared to #number_of_non_skinwalkers.
# OR, more simply, #tasks_completed_globally is incremented by 1 each time ANY player completes ANY of their tasks.
# The current phase transition logic uses #completed_tasks (which I renamed #tasks_completed_globally for clarity) >= #total_tasks_needed.
# This implies #tasks_completed_globally should be incremented when any single task is completed by any player.
# This increment should happen in the function that marks a task as done for a player.
