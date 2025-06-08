# Phase 1: Survival - Initial setup

# Set phase duration (in seconds, converted to ticks: seconds * 20)
scoreboard players set #phase1_duration skinwalker.temp 600  # 30 seconds * 20 ticks
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #phase skinwalker.phase 1

# Reset tasks for all players
execute as @a run {
    scoreboard players set @s skinwalker.tasks_completed 0
    
    # Give appropriate items based on role
    execute if entity @s[tag=survivor] run {
        give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
        give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
    }
    
    execute if entity @s[tag=youtuber] run {
        give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"blue","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
        give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
    }
}

# Notify players
title @a title ["",{"text":"PHASE 1: SURVIVAL","color":"green","bold":true}]
title @a subtitle ["",{"text":"Complete tasks and stay alive!","color":"white"}]

tellraw @a ["\n",{"text":"=== ","color":"gold"},{"text":"PHASE 1: SURVIVAL","color":"green","bold":true},{"text":" ===","color":"gold"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Complete ","color":"white"},{"text":"tasks","color":"yellow"},{"text":" to help your team","color":"white"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Beware of ","color":"white"},{"text":"Skinwalkers","color":"red"},{"text":" among you","color":"white"}]
tellraw @a ["",{"text":"• ","color":"green"},{"text":"Phase ends in ","color":"white"},{"text":"5 minutes","color":"yellow"},{"text":" or when all tasks are complete","color":"white"}]

# Play phase start sound
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1

# Set up initial tasks
function skinwalker:tasks/setup_tasks

# Update scoreboard
function skinwalker:gui/update_scoreboard
