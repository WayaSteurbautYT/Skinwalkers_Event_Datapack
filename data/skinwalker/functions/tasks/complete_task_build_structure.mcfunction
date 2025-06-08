# Complete the build structure task

data modify storage skinwalker:tasks player_tasks[{id:"build_structure"}] merge value {completed:1b}
scoreboard players add @s skinwalker.tasks 1
tellraw @s ["",{"text":"[TASK COMPLETE] ","color":"green"},{"text":"Build structure completed!","color":"white"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
