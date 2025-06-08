# Track YouTuber task progress
# This runs every few ticks to check for task completion

execute as @a[tag=youtuber] run {
    # Check each task for completion
    execute store result score #task_count skinwalker.temp run data get entity @s Tasks
    scoreboard players set #i skinwalker.temp 0
    
    # Loop through all tasks
    execute if score #task_count skinwalker.temp matches 1.. run {
        # Check for mining tasks
        execute if data entity @s {Inventory: [{id: "minecraft:diamond"}]} run {
            data modify entity @s Tasks[0].progress set from entity @s {Inventory: [{id: "minecraft:diamond"}].Count}
        }
        
        # Check for other item-based tasks
        execute if data entity @s {Inventory: [{id: "minecraft:netherite_ingot"}]} run {
            data modify entity @s Tasks[0].progress set from entity @s {Inventory: [{id: "minecraft:netherite_ingot"}].Count}
        }
        
        # Add more task tracking here...
        
        # Check for task completion
        execute store result score #progress skinwalker.temp run data get entity @s Tasks[0].progress
        execute store result score #goal skinwalker.temp run data get entity @s Tasks[0].goal
        execute if score #progress skinwalker.temp >= #goal skinwalker.temp run {
            # Task completed!
            data get entity @s Tasks[0].task
            tellraw @s ["",{"text":"[","color":"aqua"},{"text":"✓","color":"green","bold":true},{"text":"] ","color":"aqua"},{"text":"Task completed: ","color":"green"},{"text":"%s","color":"white"}]
            playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
            
            # Remove completed task
            data remove entity @s Tasks[0]
            
            # Check if all tasks are complete
            execute store result score #remaining_tasks skinwalker.temp run data get entity @s Tasks
            execute if score #remaining_tasks skinwalker.temp matches 0 run {
                # All tasks completed!
                title @s title ["",{"text":"ALL TASKS COMPLETE!","color":"green","bold":true}]
                title @s subtitle ["",{"text":"Return to the extraction point!","color":"aqua"}]
                playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
                
                # Give extraction beacon
                give @s minecraft:beacon{display:{Name:'{"text":"Extraction Beacon","color":"gold","italic":false}',Lore:['{"text":"Place this to call for extraction","color":"gray"}','{"text":"You win when extracted!","color":"green"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2002} 1
                
                # Mark as completed tasks
                tag @s add tasks_completed
            }
        }
    }
}
