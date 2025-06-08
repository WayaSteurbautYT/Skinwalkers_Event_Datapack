# Assign a travel task to the player

# Set up the task
scoreboard players set @s skinwalker.task_travel_distance 0
scoreboard players set @s skinwalker.task_travel_distance_required 500

# Store starting position
execute store result score @s skinwalker.start_x run data get entity @s Pos[0]
execute store result score @s skinwalker.start_z run data get entity @s Pos[2]

# Give some food and a compass
give @s minecraft:cooked_beef 16
give @s minecraft:compass{display:{Name:'{"text":"Distance Tracker","color":"aqua"}'},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:32}

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Exploration Task\n\nTravel 500 blocks from your starting point!\n\nProgress: 0/500 blocks\n\nYour starting point has been marked. The further you go, the more progress you'll make!\n\nTip: The compass points to your starting location."}'],title:"Exploration Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Travel 500 blocks","color":"gold"},{"text":" (0/500)","color":"gray"}]
