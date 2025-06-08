# Give items to YouTuber role

# Clear inventory first
clear @s

# Main hand - Diamond Sword
give @s minecraft:diamond_sword{display:{Name:'{"text":"YouTuber's Sword","color":"aqua","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:3},{id:"minecraft:unbreaking",lvl:3},{id:"minecraft:knockback",lvl:1}],CustomModelData:1007} 1

# Off hand - Shield
give @s minecraft:shield{display:{Name:'{"text":"YouTuber's Shield","color":"blue","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:3}],BlockEntityTag:{Base:1}} 1

# Hotbar items
# Slot 1 - Task Tracker
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"blue","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1

# Slot 2 - Phase Timer
give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1

# Slot 3 - Golden Apples
give @s minecraft:golden_apple{display:{Name:'{"text":"Golden Apple","color":"gold","italic":false}'},HideFlags:32} 3

# Slot 4 - Ender Pearl
give @s minecraft:ender_pearl{display:{Name:'{"text":"Emergency Teleport","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1007} 2

# Slot 5 - Bow
give @s minecraft:bow{display:{Name:'{"text":"YouTuber's Bow","color":"white","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:power",lvl:2},{id:"minecraft:unbreaking",lvl:3}],CustomModelData:1008} 1

# Slot 6 - Arrows
give @s minecraft:arrow{display:{Name:'{"text":"Arrows","color":"gray","italic":false}'},HideFlags:32} 16

# Slot 7 - Splash Potion of Healing II
give @s minecraft:splash_potion{display:{Name:'{"text":"Healing Potion","color":"red","italic":false}'},HideFlags:32,CustomPotionColor:16262179,CustomPotionEffects:[{Id:6,Duration:1,Amplifier:1,ShowParticles:0b}]} 2

# Slot 8 - Steak
give @s minecraft:cooked_beef{display:{Name:'{"text":"Steak","color":"gold","italic":false}'},HideFlags:32} 8

# Slot 9 - Water Bucket
give @s minecraft:water_bucket{display:{Name:'{"text":"Water Bucket","color":"blue","italic":false}'},HideFlags:32} 1

# Set hotbar slots
item replace entity @s weapon.mainhand with minecraft:diamond_sword
item replace entity @s weapon.offhand with minecraft:shield
item replace entity @s hotbar.0 with minecraft:compass
item replace entity @s hotbar.1 with minecraft:clock
item replace entity @s hotbar.2 with minecraft:golden_apple
item replace entity @s hotbar.3 with minecraft:ender_pearl
item replace entity @s hotbar.4 with minecraft:bow
item replace entity @s hotbar.5 with minecraft:arrow
item replace entity @s hotbar.6 with minecraft:splash_potion
item replace entity @s hotbar.7 with minecraft:cooked_beef
item replace entity @s hotbar.8 with minecraft:water_bucket

# Give diamond armor (unenchanted)
give @s minecraft:diamond_helmet{display:{Name:'{"text":"YouTuber's Helmet","color":"aqua","italic":false}'},HideFlags:32} 1
give @s minecraft:diamond_chestplate{display:{Name:'{"text":"YouTuber's Chestplate","color":"aqua","italic":false}'},HideFlags:32} 1
give @s minecraft:diamond_leggings{display:{Name:'{"text":"YouTuber's Leggings","color":"aqua","italic":false}'},HideFlags:32} 1
give @s minecraft:diamond_boots{display:{Name:'{"text":"YouTuber's Boots","color":"aqua","italic":false}'},HideFlags:32} 1

# Equip armor
replaceitem entity @s armor.head minecraft:diamond_helmet
replaceitem entity @s armor.chest minecraft:diamond_chestplate
replaceitem entity @s armor.legs minecraft:diamond_leggings
replaceitem entity @s armor.feet minecraft:diamond_boots

# Give permanent effects
effect give @s minecraft:hero_of_the_village 999999 0 true
effect give @s minecraft:luck 999999 0 true
