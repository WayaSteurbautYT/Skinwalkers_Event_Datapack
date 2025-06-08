# Complete the mine ores task

data modify storage skinwalker:tasks player_tasks[{id:"mine_ores"}] merge value {completed:1b}
scoreboard players add @s skinwalker.tasks 1
tellraw @s ["",{"text":"[TASK COMPLETE] ","color":"green"},{"text":"Mine ores completed!","color":"white"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
