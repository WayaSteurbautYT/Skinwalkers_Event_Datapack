# Task: Travel distance

# Add task to player's list
scoreboard players add @s skinwalker.tasks 1

# Store task data
data modify storage skinwalker:tasks player_tasks append value {id:"travel_distance",completed:0b,progress:0,target:1000,description:"Travel 1000 blocks"}

tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"Travel 1000 blocks","color":"white"}]
