# Emergency Beacon - Reveal nearby Skinwalkers
# This function is triggered when a player uses/right-clicks the Emergency Beacon item.
# It reveals nearby Skinwalkers to the user and their teammates.

# Check cooldown
execute if score @s skinwalker.beacon_cooldown matches 1.. run {
    # Convert ticks to seconds
    scoreboard players operation #seconds_remaining skinwalker.temp = @s skinwalker.beacon_cooldown
    scoreboard players operation #seconds_remaining skinwalker.temp /= 20 skinwalker.temp
    
    # Notify player
    title @s actionbar ["",{"text":"[","color":"red"},{"text":"!","color":"dark_red","bold":true},{"text":"] ","color":"red"},{"text":"Beacon on cooldown: ","color":"white"},{"score":{"name":"#seconds_remaining","objective":"skinwalker.temp"},"color":"yellow"},{"text":"s","color":"white"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Set cooldown (2 minutes)
scoreboard players set @s skinwalker.beacon_cooldown 2400

# Visual effects
playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5
particle minecraft:enchant ~ ~2 ~ 5 2 5 0.5 50
particle minecraft:flash ~ ~2 ~ 0.5 0.5 0.5 0.1 100

title @s title ["",{"text":"EMERGENCY BEACON ACTIVATED!","color":"yellow","bold":true}]
title @s subtitle ["",{"text":"Revealing nearby Skinwalkers...","color":"white"}]

# Notify nearby players
execute at @s run tellraw @a[distance=..30] ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"dark_gray"},{"selector":"@s","color":"yellow"},{"text":" activated an ","color":"white"},{"text":"Emergency Beacon","color":"yellow"},{"text":"!","color":"white"}]

# Flash effect for all nearby players (visual cue that beacon fired)
execute at @s run effect give @a[distance=..30] minecraft:glowing 10 0 true

# Reveal Skinwalkers in 20 block radius (actual reveal logic is in this function)
# This should apply glowing effect specifically to players identified as Skinwalkers.
execute at @s run function skinwalker:items/reveal_skinwalkers

# Remove one beacon from inventory
# Assuming the beacon is a totem_of_undying with CustomModelData:2001.
# This makes the item consumption specific.
clear @s minecraft:totem_of_undying{CustomModelData:2001} 1
