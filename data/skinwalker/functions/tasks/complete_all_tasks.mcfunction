# Handle when a player completes all their tasks

# Set all task scores to completed
scoreboard players set @s skinwalker.task_mine_ores 1
scoreboard players set @s skinwalker.task_craft_items 1
scoreboard players set @s skinwalker.task_kill_mobs 1
scoreboard players set @s skinwalker.task_travel_distance 1
scoreboard players set @s skinwalker.task_build_structure 1

# Set tasks completed to total
scoreboard players set @s skinwalker.tasks_completed 5

# Give completion rewards
give @s minecraft:netherite_ingot{display:{Name:'{"text":"Master Survivor Trophy","color":"gold"}'},Enchantments:[{}],HideFlags:1} 1
give @s minecraft:experience_bottle 16
effect give @s minecraft:hero_of_the_village 1200 1 true
effect give @s minecraft:glowing 600 0 true

# Play completion effects
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
particle minecraft:end_rod ~ ~1 ~ 1 2 1 0.1 100 force @s

# Show completion message
title @s times 10 60 20
title @s title ["",{"text":"ALL TASKS COMPLETED!","color":"gold","bold":true}]
title @s subtitle ["",{"text":"You've completed all your tasks!","color":"white"}]

tellraw @s ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"You've completed ","color":"white"},{"text":"all tasks","color":"gold"},{"text":" and received ","color":"white"},{"text":"special rewards","color":"gold"},{"text":"!","color":"white"}]

# Notify other players
execute as @a[tag=survivor] at @s if entity @s[tag=!s] run tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"selector":"@s","color":"green"},{"text":" has completed ","color":"white"},{"text":"all tasks","color":"gold"},{"text":"!","color":"white"}]

# Check if all survivors have completed their tasks
scoreboard players set #completed_survivors skinwalker.temp 0
scoreboard players set #total_survivors skinwalker.temp 0

execute as @a[tag=survivor] run {
    scoreboard players add #total_survivors skinwalker.temp 1
    execute if score @s skinwalker.tasks_completed >= #total_tasks skinwalker.temp run {
        scoreboard players add #completed_survivors skinwalker.temp 1
    }
}

# If all survivors have completed their tasks, advance to the next phase
execute if score #completed_survivors skinwalker.temp >= #total_survivors skinwalker.temp run {
    tellraw @a ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"All survivors have completed their tasks! ","color":"white"},{"text":"Preparing next phase...","color":"yellow"}]
    
    # Schedule the phase transition
    schedule function skinwalker:phase2/start 3s
}
