# Give Skinwalker their special abilities
# Clear inventory first
clear @s

# Give Disguise ability (Carrot on a Stick for right-click detection)
give @s minecraft:carrot_on_a_stick{CustomModelData:1003,display:{Name:'{"text":"Disguise","color":"red","italic":false}',Lore:['{"text":"Right-click to use","color":"gray"}','{"text":"Cooldown: 60s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Claws (Carrot on a Stick for right-click detection)
give @s minecraft:carrot_on_a_stick{CustomModelData:1001,display:{Name:'{"text":"Skinwalker Claws","color":"dark_red","italic":false}',Lore:['{"text":"Right-click to use","color":"gray"}','{"text":"Cooldown: 5s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Phase Shift (Carrot on a Stick for right-click detection)
give @s minecraft:carrot_on_a_stick{CustomModelData:1002,display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to use","color":"gray"}','{"text":"Cooldown: 30s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Set cooldowns
scoreboard players set @s skinwalker.cooldown.disguise 0
scoreboard players set @s skinwalker.cooldown.phase 0
scoreboard players set @s skinwalker.claws_cooldown 0
scoreboard players set @s skinwalker.claws_cooldown_max 100

# Give night vision
effect give @s minecraft:night_vision 999999 0 true

# Message about abilities
title @s title ["",{"text":"SKINWALKER ABILITIES","color":"red","bold":true}]
title @s subtitle ["",{"text":"Use your powers wisely...","color":"dark_red"}]

# Play ability sound
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 0.5
