# Complete the travel distance task

data modify storage skinwalker:tasks player_tasks[{id:"travel_distance"}] merge value {completed:1b}
scoreboard players add @s skinwalker.tasks 1
tellraw @s ["",{"text":"[TASK COMPLETE] ","color":"green"},{"text":"Travel distance completed!","color":"white"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
