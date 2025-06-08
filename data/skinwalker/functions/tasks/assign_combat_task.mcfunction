# Assign a combat task to the player

# Set up the task
scoreboard players set @s skinwalker.task_kill_mobs 0
scoreboard players set @s skinwalker.task_kill_mobs_required 10

# Give a basic weapon and armor
give @s minecraft:stone_sword{Unbreakable:1,Enchantments:[{id:sharpness,lvl:1}],display:{Name:'{"text":"Hunting Sword","color":"dark_red"}}'}
give @s minecraft:leather_helmet{Unbreakable:1,Enchantments:[{id:protection,lvl:1}],display:{Name:'{"text":"Hunter's Cap","color":"dark_red"}}'}

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Combat Task\n\nDefeat 10 hostile mobs!\n\nProgress: 0/10 mobs\n\nHostile mobs include:\n- Zombies\n- Skeletons\n- Spiders\n- Creepers\n- Endermen\n- Witches\n- Phantoms\n- Drowned\n- Strays\n- Husks\n- Slimes\n- Magma Cubes\n- Blazes\n- Ghasts\n- Hoglins\n- Piglins\n- Wither Skeletons\n\nBosses count as 5 mobs!"}'],title:"Combat Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Defeat 10 hostile mobs","color":"gold"},{"text":" (0/10)","color":"gray"}]
