# Player has completed the first task

# Mark task as completed
scoreboard players set @s skinwalker.task1 1

# Remove the required items
clear @s minecraft:oak_log 16
clear @s minecraft:stone 32

# Play completion sound and effects
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 50

# Send congratulations
title @s title ["",{"text":"TASK COMPLETED!","color":"green","bold":true}]
title @s subtitle ["",{"text":"You've completed the first challenge!","color":"gray"}]

tellraw @s ["",{"text":"Task ","color":"gray"},{"text":"1","color":"green"},{"text":" completed! Return to the YouTuber for your next task.","color":"gray"}]

# Update task tracker item
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:['{"text":"Current Task: Return to YouTuber","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Check if all players have completed the task
execute unless entity @a[scores={skinwalker.task1=0}] run function skinwalker:youtuber/give_second_task
