# Give Survivor their special abilities
# Clear inventory first
clear @s

# Give Task Tracker (Compass)
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:['{"text":"Shows your current tasks","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Flashlight (Lantern)
give @s minecraft:lantern{display:{Name:'{"text":"Flashlight","color":"yellow","italic":false}',Lore:['{"text":"Right-click to toggle","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give First Aid (Golden Apple)
give @s minecraft:golden_apple{display:{Name:'{"text":"First Aid Kit","color":"red","italic":false}',Lore:['{"text":"Heals you when right-clicked","color":"gray"}','{"text":"Cooldown: 60s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Adrenaline Shot (Potion)
give @s minecraft:potion{CustomModelData:3001,display:{Name:'{"text":"Adrenaline Shot","color":"aqua","italic":false}',Lore:['{"text":"Grants a quick burst of speed and regeneration.","color":"gray"}','{"text":"Single use. Be wise.","color":"dark_gray"}]}} 1

# Set cooldowns
scoreboard players set @s skinwalker.cooldown.firstaid 0
scoreboard players set @s skinwalker.adrenaline_cooldown 0 # Initialize cooldown for new item

# Message about abilities
title @s title ["",{"text":"SURVIVOR ITEMS","color":"green","bold":true}]
title @s subtitle ["",{"text":"Complete tasks and survive!","color":"dark_green"}]

# Play ability sound
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
