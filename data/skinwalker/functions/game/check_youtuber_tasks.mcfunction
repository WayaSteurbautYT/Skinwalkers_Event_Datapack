# Check and update YouTuber task progress
# This runs every 5 seconds to update task progress

execute as @a[tag=youtuber] run {
    # Check each task for completion
    execute store result score #task_count skinwalker.temp run data get entity @s Tasks
    
    # Only proceed if player has tasks
    execute if score #task_count skinwalker.temp matches 1.. run {
        # Check for mining tasks
        execute store result score #diamonds skinwalker.temp run clear @s minecraft:diamond 0
        execute if score #diamonds skinwalker.temp matches 1.. run {
            data modify entity @s Tasks[{type:"minecraft:diamond"}].progress set from score #diamonds skinwalker.temp
        }
        
        # Check for netherite ingot
        execute store result score #netherite skinwalker.temp run clear @s minecraft:netherite_ingot 0
        execute if score #netherite skinwalker.temp matches 1.. run {
            data modify entity @s Tasks[{type:"minecraft:netherite_ingot"}].progress set from score #netherite skinwalker.temp
        }
        
        # Check for golden apples eaten (using scoreboard)
        execute if score @s skinwalker.golden_apples_eaten matches 1.. run {
            data modify entity @s Tasks[{type:"minecraft:golden_apple"}].progress set from score @s skinwalker.golden_apples_eaten
        }
        
        # Check for mob kills (using scoreboard)
        execute if score @s skinwalker.mob_kills matches 1.. run {
            data modify entity @s Tasks[{type:"mob_kills"}].progress set from score @s skinwalker.mob_kills
        }
        
        # Check for distance traveled (using scoreboard)
        execute if score @s skinwalker.distance_traveled matches 1.. run {
            data modify entity @s Tasks[{type:"distance_traveled"}].progress set from score @s skinwalker.distance_traveled
        }
        
        # Check for animals bred (using scoreboard)
        execute if score @s skinwalker.animals_bred matches 1.. run {
            data modify entity @s Tasks[{type:"animals_bred"}].progress set from score @s skinwalker.animals_bred
        }
        
        # Check for items enchanted (using scoreboard)
        execute if score @s skinwalker.items_enchanted matches 1.. run {
            data modify entity @s Tasks[{type:"item_enchanted"}].progress set from score @s skinwalker.items_enchanted
        }
        
        # Check for villager trades (using scoreboard)
        execute if score @s skinwalker.villager_trades matches 1.. run {
            data modify entity @s Tasks[{type:"traded_with_villager"}].progress set from score @s skinwalker.villager_trades
        }
        
        # Check for Ender Dragon kill (using scoreboard)
        execute if score @s skinwalker.dragon_killed matches 1.. run {
            data modify entity @s Tasks[{type:"minecraft:dragon_head"}].progress set from score @s skinwalker.dragon_killed
        }
        
        # Check for task completion
        execute store result score #tasks_completed skinwalker.temp run data get entity @s Tasks[].progress
        execute store result score #task_goals skinwalker.temp run data get entity @s Tasks[].goal
        
        # Check if any task is completed
        execute if score #tasks_completed skinwalker.temp >= #task_goals skinwalker.temp run {
            # Get the completed task
            data get entity @s Tasks[0].task
            
            # Notify player
            tellraw @s ["",
                {"text":"[","color":"aqua"},
                {"text":"✓","color":"green","bold":true},
                {"text":"] ","color":"aqua"},
                {"text":"Task completed: ","color":"green"},
                {"text":"%s","color":"white"}
            ]
            
            # Play completion sound
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
                
                # Notify all players
                tellraw @a ["",
                    {"text":"[","color":"aqua"},
                    {"text":"!","color":"dark_aqua","bold":true},
                    {"text":"] ","color":"aqua"},
                    {"selector":"@s"},
                    {"text":" has completed all their tasks!","color":"green"}
                ]
            }
        }
    }
}

# Clear temporary scores
scoreboard players set #diamonds skinwalker.temp 0
scoreboard players set #netherite skinwalker.temp 0
