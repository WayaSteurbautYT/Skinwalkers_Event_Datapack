# Emergency Beacon - Reveal nearby Skinwalkers

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

# Flash effect for nearby players
execute at @s run effect give @a[distance=..30] minecraft:glowing 10 0 true

# Reveal Skinwalkers in 20 block radius
execute at @s run function skinwalker:items/reveal_skinwalkers

# Remove one beacon from inventory
# Using 'clear' is generally more reliable for removing a specific count.
# Assuming the beacon is a totem_of_undying with specific NBT (like CustomModelData:2001).
# For simplicity, if it's just one type of beacon item the player has:
clear @s minecraft:totem_of_undying 1
# If more specific NBT matching is needed and CustomModelData is consistently applied:
# clear @s minecraft:totem_of_undying{CustomModelData:2001} 1
