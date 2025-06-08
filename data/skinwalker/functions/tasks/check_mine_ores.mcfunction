# Check mine ores task completion

execute store result score #ores_mined skinwalker.temp run clear @s minecraft:coal_ore 0 0
scoreboard players operation @s skinwalker.temp = #ores_mined skinwalker.temp
execute store result score #ores_mined skinwalker.temp run clear @s minecraft:iron_ore 0 0
scoreboard players operation @s skinwalker.temp += #ores_mined skinwalker.temp
execute store result score #ores_mined skinwalker.temp run clear @s minecraft:gold_ore 0 0
scoreboard players operation @s skinwalker.temp += #ores_mined skinwalker.temp
execute store result score #ores_mined skinwalker.temp run clear @s minecraft:diamond_ore 0 0
scoreboard players operation @s skinwalker.temp += #ores_mined skinwalker.temp

# Update task progress
data modify storage skinwalker:tasks player_tasks[{id:"mine_ores"}].progress set from score @s skinwalker.temp

# Check if task is completed
execute if score @s skinwalker.temp >= 16 run function skinwalker:tasks/complete_task_mine_ores
