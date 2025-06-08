# Task: Craft items

# Add task to player's list
scoreboard players add @s skinwalker.tasks 1

# Store task data
data modify storage skinwalker:tasks player_tasks append value {id:"craft_items",completed:0b,progress:0,target:8,description:"Craft 8 items"}

tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"Craft 8 items","color":"white"}]
