# Assign a crafting task to the player

# Set up the task
scoreboard players set @s skinwalker.task_craft_items 0
scoreboard players set @s skinwalker.task_craft_items_required 16

# Give some basic crafting materials
give @s minecraft:oak_planks 32
give @s minecraft:cobblestone 32
give @s minecraft:iron_ingot 16

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Crafting Task\n\nCraft 16 items!\n\nProgress: 0/16 items\n\nYou can craft any items in the game. Some suggestions:\n- Tools\n- Weapons\n- Armor\n- Crafting blocks\n- Redstone components"}'],title:"Crafting Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Craft 16 items","color":"gold"},{"text":" (0/16)","color":"gray"}]
