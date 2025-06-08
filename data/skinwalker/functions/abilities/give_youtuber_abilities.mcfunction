# Give YouTuber their special abilities
# Clear inventory first
clear @s

# Give Task Giver (Book)
give @s minecraft:book{display:{Name:'{"text":"Task List","color":"blue","italic":false}',Lore:['{"text":"Right-click to assign tasks to survivors","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Give Emergency Beacon (Clock)
give @s minecraft:clock{display:{Name:'{"text":"Emergency Beacon","color":"gold","italic":false}',Lore:['{"text":"Reveals nearby Skinwalkers","color":"gray"}','{"text":"Cooldown: 120s","color":"dark_gray"}']},Enchantments:[{}],HideFlags:1} 1

# Set cooldowns
scoreboard players set @s skinwalker.cooldown.beacon 0

# Message about abilities
title @s title ["",{"text":"YOUTUBER ABILITIES","color":"blue","bold":true}]
title @s subtitle ["",{"text":"Help survivors complete tasks!","color":"dark_blue"}]

# Play ability sound
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
