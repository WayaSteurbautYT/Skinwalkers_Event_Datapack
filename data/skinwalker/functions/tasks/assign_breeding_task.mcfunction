# Assign an animal breeding task to the player

# Set up the task
scoreboard players set @s skinwalker.task_breed_animals 0
scoreboard players set @s skinwalker.task_breed_animals_required 5

# Give some breeding materials
give @s minecraft:wheat 32
give @s minecraft:carrot 16
give @s minecraft:potato 16
give @s minecraft:seeds 32
give @s minecraft:bone_meal 16

# Add to the task book
execute store result storage skinwalker:temp TaskSlot int 1 run scoreboard players get @s skinwalker.task_count
execute store result storage skinwalker:temp TaskPage int 1 run scoreboard players get @s skinwalker.task_count

data modify storage skinwalker:temp TaskBook set value {id:"minecraft:written_book",Count:1b,tag:{pages:['{"text":"Animal Husbandry Task\n\nBreed 5 pairs of animals!\n\nProgress: 0/5 animals bred\n\nBreedable animals include:\n- Cows (Wheat)\n- Sheep (Wheat)\n- Pigs (Carrot/Potato)\n- Chickens (Seeds)\n- Rabbits (Dandelion/Carrot)\n- Wolves (Any meat)\n- Cats (Raw Cod/Salmon)\n- Foxes (Sweet Berries)\n- Turtles (Seagrass)\n- Horses/Donkeys (Golden Apple/Carrot)\n- Llamas (Hay Bale)\n- Goats (Wheat)\n- Axolotls (Tropical Fish)"}],title:"Breeding Task",author:"Game Master"}}

tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"text":"New task: ","color":"white"},{"text":"Breed 5 pairs of animals","color":"gold"},{"text":" (0/5)","color":"gray"}]
