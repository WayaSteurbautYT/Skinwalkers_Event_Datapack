# Task: Kill mobs

# Add task to player's list
scoreboard players add @s skinwalker.tasks 1

# Store task data
data modify storage skinwalker:tasks player_tasks append value {id:"kill_mobs",completed:0b,progress:0,target:10,description:"Kill 10 hostile mobs"}

tellraw @s ["",{"text":"[TASK] ","color":"yellow"},{"text":"Kill 10 hostile mobs","color":"white"}]
