# Give items to Skinwalker role

# Clear inventory first
clear @s

# Main hand - Claws
give @s minecraft:netherite_sword{display:{Name:'{"text":"Skinwalker Claws","color":"red","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:sharpness",lvl:5},{id:"minecraft:unbreaking",lvl:3}],AttributeModifiers:[],CustomModelData:1003} 1

# Off hand - Disguise Kit
give @s minecraft:player_head{display:{Name:'{"text":"Disguise Kit","color":"yellow","italic":false}'},HideFlags:32,SkullOwner:{Id:[I;0,0,0,0],Properties:{textures:[{Value:""}]}},CustomModelData:1005} 1

# Hotbar items
# Slot 1 - Phase Shift (Ender Pearl)
give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}'},HideFlags:32,CustomModelData:1004} 2

# Slot 2 - Night Vision Potion (for seeing in the dark)
give @s minecraft:potion{display:{Name:'{"text":"Night Vision","color":"dark_aqua","italic":false}'},HideFlags:32,CustomPotionColor:4393481,CustomPotionEffects:[{Id:16,Duration:3600,Amplifier:0,ShowParticles:0b}]} 1

# Slot 3 - Strength Potion (for combat)
give @s minecraft:potion{display:{Name:'{"text":"Bloodlust Potion","color":"dark_red","italic":false}'},HideFlags:32,CustomPotionColor:16262179,CustomPotionEffects:[{Id:5,Duration:200,Amplifier:1,ShowParticles:0b}]} 1

# Slot 4 - Speed Potion (for chasing)
give @s minecraft:potion{display:{Name:'{"text":"Swiftness Potion","color":"blue","italic":false}'},HideFlags:32,CustomPotionColor:2293580,CustomPotionEffects:[{Id:1,Duration:200,Amplifier:1,ShowParticles:0b}]} 1

# Slot 5 - Cobwebs (for trapping survivors)
give @s minecraft:cobweb{display:{Name:'{"text":"Web Trap","color":"gray","italic":false}'},HideFlags:32} 5

# Slot 6 - Steak (food)
give @s minecraft:cooked_beef{display:{Name:'{"text":"Flesh","color":"red","italic":false}'},HideFlags:32} 8

# Slot 7 - Invisibility Potion (for sneaking up on survivors)
give @s minecraft:potion{display:{Name:'{"text":"Cloak of Shadows","color":"dark_gray","italic":false}'},HideFlags:32,CustomPotionColor:1315860,CustomPotionEffects:[{Id:14,Duration:600,Amplifier:0,ShowParticles:0b}]} 1

# Set hotbar slots
item replace entity @s weapon.mainhand with minecraft:netherite_sword
item replace entity @s weapon.offhand with minecraft:player_head
item replace entity @s hotbar.0 with minecraft:ender_pearl
item replace entity @s hotbar.1 with minecraft:potion
item replace entity @s hotbar.2 with minecraft:potion
item replace entity @s hotbar.3 with minecraft:potion
item replace entity @s hotbar.4 with minecraft:cobweb
item replace entity @s hotbar.5 with minecraft:cooked_beef
item replace entity @s hotbar.6 with minecraft:potion

# Give leather armor (tinted red)
give @s minecraft:leather_helmet{display:{Name:'{"text":"Skinwalker Hood","color":"red","italic":false}'},HideFlags:32,color:11546150} 1
give @s minecraft:leather_chestplate{display:{Name:'{"text":"Skinwalker Hide","color":"red","italic":false}'},HideFlags:32,color:11546150} 1
give @s minecraft:leather_leggings{display:{Name:'{"text":"Skinwalker Leggings","color":"red","italic":false}'},HideFlags:32,color:11546150} 1
give @s minecraft:leather_boots{display:{Name:'{"text":"Skinwalker Boots","color":"red","italic":false}'},HideFlags:32,color:11546150} 1

# Equip armor
replaceitem entity @s armor.head minecraft:leather_helmet
replaceitem entity @s armor.chest minecraft:leather_chestplate
replaceitem entity @s armor.legs minecraft:leather_leggings
replaceitem entity @s armor.feet minecraft:leather_boots

# Give permanent effects
effect give @s minecraft:night_vision 999999 0 true
effect give @s minecraft:speed 999999 0 true
effect give @s minecraft:jump_boost 999999 0 true
