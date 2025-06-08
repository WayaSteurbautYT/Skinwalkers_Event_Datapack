# Give Skinwalker their special abilities
# Clear inventory first
clear @s

# Give Disguise ability (Compass)
give @s minecraft:compass{display:{Name:'{"text":"Disguise","color":"red","italic":false}',Lore:['{"text":"Right-click to copy a nearby player\'s appearance","color":"gray"}','{"text":"Cooldown: 60s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Claws (Iron Sword)
give @s minecraft:iron_sword{display:{Name:'{"text":"Skinwalker Claws","color":"dark_red","italic":false}',Lore:['{"text":"Left-click to attack survivors","color":"gray"}','{"text":"Cooldown: 3s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Phase Shift (Ender Pearl)
give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to teleport forward","color":"gray"}','{"text":"Cooldown: 30s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Set cooldowns
scoreboard players set @s skinwalker.cooldown.disguise 0
scoreboard players set @s skinwalker.cooldown.phase 0

# Give night vision
effect give @s minecraft:night_vision 999999 0 true

# Message about abilities
title @s title ["",{"text":"SKINWALKER ABILITIES","color":"red","bold":true}]
title @s subtitle ["",{"text":"Use your powers wisely...","color":"dark_red"}]

# Play ability sound
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 0.5
