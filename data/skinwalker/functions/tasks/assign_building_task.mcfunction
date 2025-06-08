# Assign a building task to the player

# Set up the task
scoreboard players set @s skinwalker.task_build_structure 0
scoreboard players set @s skinwalker.task_build_structure_required 1

# Give some building materials
give @s minecraft:oak_planks 64
give @s minecraft:oak_stairs 32
give @s minecraft:oak_slab 32
give @s minecraft:glass 32
give @s minecraft:torch 16
give @s minecraft:crafting_table 1

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Building Task\n\nConstruct a structure!\n\nProgress: 0/1 structures\n\nBuild any structure that meets these requirements:\n- At least 5x5 blocks in size\n- At least 3 blocks tall\n- Has a roof\n- Has a door or entrance\n- Has at least one light source\n\nRight-click with the structure complete to verify it!"}'],title:"Building Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Build a structure","color":"gold"},{"text":" (0/1)","color":"gray"}]
