# Task: Build structure

# Add task to player's list
scoreboard players add @s skinwalker.tasks 1

# Store task data
data modify storage skinwalker:tasks player_tasks append value {id:"build_structure",completed:0b,progress:0,target:1,description:"Build a structure (10x10 area)"}

tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"Build a structure (10x10 area)","color":"white"}]
