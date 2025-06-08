# Craftee's interaction - Building challenge
tellraw @a ["",{"text":"[Craftee]","color":"green"},{"text":" I crafted a modded mob… good luck beating it."}]

# Spawn a boss or something interesting
summon zombie ~ ~ ~ {CustomName:'{"text":"Cursed Golem","color":"dark_green"}',Health:100.0f,Attributes:[{Name:generic.max_health,Base:100.0f}],HandItems:[{id:"minecraft:iron_sword",Count:1b}],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:iron_chestplate",Count:1b},{id:"minecraft:carved_pumpkin",Count:1b}]}

# Give all players an advancement
title @a title ["",{"text":"Goal Reached!","color":"green"}]
title @a subtitle ["",{"text":"A Crafting Table That Watches You","color":"dark_green"}]
