# Assign a fishing task to the player

# Set up the task
scoreboard players set @s skinwalker.task_fish_items 0
scoreboard players set @s skinwalker.task_fish_items_required 10

# Give a fishing rod and some food
give @s minecraft:fishing_rod{Unbreakable:1,Enchantments:[{id:lure,lvl:2},{id:luck_of_the_sea,lvl:2}],display:{Name:'{"text":"Lucky Fishing Rod","color":"aqua"}}'}
give @s minecraft:cooked_salmon 8

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Fishing Task\n\nCatch 10 items while fishing!\n\nProgress: 0/10 items\n\nYou can catch:\n- Fish (Raw Cod, Raw Salmon, Pufferfish, Tropical Fish)\n- Treasure (Name Tags, Saddles, Enchanted Books, etc.)\n- Junk (Lily Pads, Leather, etc.)\n\nAll catches count toward your total!"}'],title:"Fishing Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Catch 10 items while fishing","color":"gold"},{"text":" (0/10)","color":"gray"}]
