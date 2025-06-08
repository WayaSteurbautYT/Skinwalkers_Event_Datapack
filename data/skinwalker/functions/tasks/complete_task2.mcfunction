# Player has completed the second task

# Mark task as completed
scoreboard players set @s skinwalker.task2 1

# Play completion sound and effects
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 100

title @s title ["",{"text":"TASK COMPLETED!","color":"green","bold":true}]
title @s subtitle ["",{"text":"You've crafted a full set of iron gear!","color":"gray"}]

tellraw @s ["",{"text":"Task ","color":"gray"},{"text":"2","color":"yellow"},{"text":" completed! Return to the YouTuber for your next task.","color":"gray"}]

# Update task tracker item
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"yellow","italic":false}',Lore:['{"text":"Current Task: Return to YouTuber","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Check if all players have completed the task
execute unless entity @a[scores={skinwalker.task2=0}] run function skinwalker:youtuber/give_final_task
