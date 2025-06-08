# Reward a player for completing a task
# Parameters:
#   - storage skinwalker:temp TaskReward - The type of reward to give
#   - storage skinwalker:temp TaskName - The display name of the task

# Give XP based on task type
execute store result score #xp_amount skinwalker.temp run data get storage skinwalker:temp TaskReward

execute if score #xp_amount skinwalker.temp matches 1.. run {
    # Small XP reward for basic tasks
    experience add @s 5 points
}

execute if score #xp_amount skinwalker.temp matches 5.. run {
    # Medium XP reward for medium tasks
    experience add @s 10 points
}

execute if score #xp_amount skinwalker.temp matches 10.. run {
    # Large XP reward for difficult tasks
    experience add @s 20 points
}

# Give items based on task type
execute if score #xp_amount skinwalker.temp matches 1.. run {
    # Basic items for any task completion
    give @s minecraft:emerald 1
}

execute if score #xp_amount skinwalker.temp matches 5.. run {
    # Better items for medium tasks
    give @s minecraft:experience_bottle 3
}

execute if score #xp_amount skinwalker.temp matches 10.. run {
    # Best items for difficult tasks
    give @s minecraft:diamond 1
}

# Apply effects
effect give @s minecraft:regeneration 30 0
effect give @s minecraft:speed 120 0

# Play sound and show title
title @s title ["",{"text":"TASK COMPLETE!","color":"green","bold":true}]
title @s subtitle ["",{"text":"Task completed successfully!","color":"white"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1

# Send chat message
data modify storage skinwalker:temp TaskName set from storage skinwalker:temp TaskName
execute store result entity @s string @s.SkinwalkerTaskName run data get storage skinwalker:temp TaskName
tellraw @s ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"You completed the task: ","color":"white"},{"nbt":"SkinwalkerTaskName","entity":"@s","color":"green"}]

data remove entity @s SkinwalkerTaskName

# Update task list display
function skinwalker:tasks/update_task_list

# Check if all tasks are completed
scoreboard players set #completed skinwalker.temp 0
scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure

# If all tasks completed, show celebration
execute if score #completed skinwalker.temp matches 5 run {
    title @s times 0 40 10
    title @s title ["",{"text":"ALL TASKS COMPLETED!","color":"green","bold":true}]
    title @s subtitle ["",{"text":"You've completed all your tasks!","color":"white"}]
    playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
    
    # Give final reward
    give @s minecraft:netherite_ingot{display:{Name:'{"text":"Champion's Trophy","color":"gold"}'},Enchantments:[{}],HideFlags:1} 1
    effect give @s minecraft:hero_of_the_village 600 1 true
    
    # Notify everyone
    tellraw @a ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"","color":"white"},{"selector":"@s","color":"green"},{"text":" has completed all their tasks!","color":"white"}]
}
