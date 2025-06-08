# Task: Mine ores

# Add task to player's list
scoreboard players add @s skinwalker.tasks 1

# Store task data
data modify storage skinwalker:tasks player_tasks append value {id:"mine_ores",completed:0b,progress:0,target:16,description:"Mine 16 ores"}

tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"Mine 16 ores","color":"white"}]
