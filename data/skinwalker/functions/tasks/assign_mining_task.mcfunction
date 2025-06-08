# Assign a mining task to the player

# Set up the task
scoreboard players set @s skinwalker.task_mine_ores 0
scoreboard players set @s skinwalker.task_mine_ores_required 32

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Mining Task\n\nMine 32 ores!\n\nProgress: 0/32 ores\n\nOres include:\n- Coal\n- Iron\n- Gold\n- Redstone\n- Lapis\n- Diamond\n- Emerald\n- Nether Quartz\n- Nether Gold\n- Ancient Debris"}'],title:"Mining Task",author:"Game Master"}}

# Give the player a wooden pickaxe to start
clear @s minecraft:wooden_pickaxe 0
give @s minecraft:wooden_pickaxe{Unbreakable:1,Enchantments:[{id:efficiency,lvl:1}],display:{Name:'{"text":"Starter Pickaxe","color":"gold","italic":false}'}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Mine 32 ores","color":"gold"},{"text":" (0/32)","color":"gray"}]
