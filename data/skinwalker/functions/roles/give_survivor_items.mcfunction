# Give items to Survivor role

# Clear inventory first
clear @s

# Main hand - Weapon
give @s minecraft:iron_sword{display:{Name:'{"text":"Survivor's Blade","color":"white","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:2},{id:"minecraft:unbreaking",lvl:2}],CustomModelData:1006} 1

# Off hand - Shield
give @s minecraft:shield{display:{Name:'{"text":"Survivor's Shield","color":"white","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:2}],BlockEntityTag:{Base:4}} 1

# Hotbar items
# Slot 1 - Task Tracker
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1

# Slot 2 - Phase Timer
give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1

# Slot 3 - Food
scoreboard players set #food_amount skinwalker.temp 8
execute if score #playerCount playerCount >= 5 run scoreboard players set #food_amount skinwalker.temp 12
give @s minecraft:cooked_beef{display:{Name:'{"text":"Emergency Rations","color":"gold","italic":false}'},HideFlags:32} #food_amount skinwalker.temp

# Slot 4 - Cobwebs (for slowing down enemies)
give @s minecraft:cobweb{display:{Name:'{"text":"Emergency Barrier","color":"gray","italic":false}'},HideFlags:32} 3

# Slot 5 - Arrows (if they find a bow)
give @s minecraft:arrow{display:{Name:'{"text":"Arrows","color":"gray","italic":false}'},HideFlags:32} 8

# Slot 8 - Torches
give @s minecraft:torch{display:{Name:'{"text":"Light Source","color":"yellow","italic":false}'},HideFlags:32} 16

# Slot 9 - Water Bucket (for MLG water)
give @s minecraft:water_bucket{display:{Name:'{"text":"Emergency Water","color":"blue","italic":false}'},HideFlags:32} 1

# Set hotbar slots
item replace entity @s weapon.mainhand with minecraft:iron_sword
item replace entity @s weapon.offhand with minecraft:shield
item replace entity @s hotbar.0 with minecraft:compass
item replace entity @s hotbar.1 with minecraft:clock
item replace entity @s hotbar.2 with minecraft:cooked_beef
item replace entity @s hotbar.3 with minecraft:cobweb
item replace entity @s hotbar.4 with minecraft:arrow
item replace entity @s hotbar.7 with minecraft:torch
item replace entity @s hotbar.8 with minecraft:water_bucket

# Give leather armor (unenchanted)
give @s minecraft:leather_helmet{display:{Name:'{"text":"Survivor's Helmet","color":"green","italic":false}'},HideFlags:32} 1
give @s minecraft:leather_chestplate{display:{Name:'{"text":"Survivor's Chestplate","color":"green","italic":false}'},HideFlags:32} 1
give @s minecraft:leather_leggings{display:{Name:'{"text":"Survivor's Leggings","color":"green","italic":false}'},HideFlags:32} 1
give @s minecraft:leather_boots{display:{Name:'{"text":"Survivor's Boots","color":"green","italic":false}'},HideFlags:32} 1

# Equip armor
replaceitem entity @s armor.head minecraft:leather_helmet
replaceitem entity @s armor.chest minecraft:leather_chestplate
replaceitem entity @s armor.legs minecraft:leather_leggings
replaceitem entity @s armor.feet minecraft:leather_boots
