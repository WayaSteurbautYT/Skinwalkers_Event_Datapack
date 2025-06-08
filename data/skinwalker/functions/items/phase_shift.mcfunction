# Handle phase shift ability

# Check cooldown
execute if score @s skinwalker.cooldown.phase matches 1.. run {
    title @s actionbar ["",{"text":"Phase Shift on cooldown: ","color":"red"},{"score":{"name":"@s","objective":"skinwalker.cooldown.phase"},"color":"white"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Set cooldown (30 seconds)
scoreboard players set @s skinwalker.cooldown.phase 600

# Set duration (5 seconds)
scoreboard players set @s skinwalker.ability_duration 100

# Add phase shift tag
tag @s add phased

# Apply effects
effect give @s minecraft:resistance 6 255 true
effect give @s minecraft:invisibility 6 0 true

# Visual effects
particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 20
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1

# Notify player
title @s title ["",{"text":"PHASE SHIFT","color":"dark_purple","bold":true}]
title @s subtitle ["",{"text":"You are now intangible for 5 seconds!","color":"white"}]

tellraw @s ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple","bold":true},{"text":"] ","color":"dark_purple"},{"text":"You become intangible, allowing you to pass through blocks!","color":"white"}]
