# Assign random tasks to YouTubers
# This function is called during game setup

# List of possible tasks
# Format: {task: "Task description", progress: 0, goal: 100, type: "type"}
data modify storage skinwalker:youtuber_tasks Tasks set value [
    {task: "Mine 10 diamonds", progress: 0, goal: 10, type: "minecraft:diamond"},
    {task: "Craft a Netherite Ingot", progress: 0, goal: 1, type: "minecraft:netherite_ingot"},
    {task: "Kill 3 mobs", progress: 0, goal: 3, type: "mob_kills"},
    {task: "Eat 5 golden apples", progress: 0, goal: 5, type: "minecraft:golden_apple"},
    {task: "Travel 1000 blocks", progress: 0, goal: 1000, type: "distance_traveled"},
    {task: "Craft a Beacon", progress: 0, goal: 1, type: "minecraft:beacon"},
    {task: "Breed 5 animals", progress: 0, goal: 5, type: "animals_bred"},
    {task: "Enchant an item", progress: 0, goal: 1, type: "item_enchanted"},
    {task: "Trade with villagers 10 times", progress: 0, goal: 10, type: "traded_with_villager"},
    {task: "Kill the Ender Dragon", progress: 0, goal: 1, type: "minecraft:dragon_head"}
]

# Assign 3 random tasks to each YouTuber
execute as @a[tag=youtuber] run {
    # Clear previous tasks
    data remove entity @s Tasks
    
    # Copy 3 random tasks
    data modify entity @s Tasks set from storage skinwalker:youtuber_tasks Tasks
    execute store result score #task_count skinwalker.temp run data get entity @s Tasks
    execute if score #task_count skinwalker.temp matches 4.. run {
        # If there are more than 3 tasks, remove the extra ones
        data remove entity @s Tasks[3..]
    }
    
    # Reset progress for all tasks
    execute as @s run data merge entity @s {TaskProgress: {}}
    
    # Notify YouTuber of their tasks
    title @s title ["",{"text":"YOUTUBER TASKS","color":"aqua","bold":true}]
    title @s subtitle ["",{"text":"Check your compass for objectives!","color":"dark_aqua"}]
    
    # Give task compass if they don't have one
    execute unless entity @s[nbt={Inventory:[{id:"minecraft:compass"}]}] run {
        give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"aqua","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2001} 1
    }
    
    # Play sound effect
    playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
}

# Clear temporary storage
data remove storage skinwalker:youtuber_tasks Tasks
