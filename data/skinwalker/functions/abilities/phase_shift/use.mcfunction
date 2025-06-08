# Phase Shift ability - Teleport forward through blocks

# Check cooldown
scoreboard players get #phase_cooldown skinwalker.phase_cooldown
scoreboard players operation #phase_cooldown skinwalker.phase_cooldown = @s skinwalker.phase_cooldown

# If on cooldown, show message and return
execute if score #phase_cooldown skinwalker.phase_cooldown matches 1.. run {
    title @s actionbar ["",{"text":"Phase Shift is on cooldown for ","color":"dark_purple"},
        {"score":{"name":"#phase_cooldown","objective":"skinwalker.phase_cooldown"},"color":"light_purple"},
        {"text":" seconds","color":"dark_purple"}]
    return 0
}

# Set cooldown
scoreboard players operation @s skinwalker.phase_cooldown = @s skinwalker.phase_cooldown_max

# Visual effects at origin
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1
particle minecraft:portal ~ ~1 ~ 1 2 1 0.1 100
particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 20
particle minecraft:smoke ~ ~1 ~ 1 2 1 0.1 30

# Save current position for later
execute store result score #x1 skinwalker.temp run data get entity @s Pos[0] 1000
execute store result score #y1 skinwalker.temp run data get entity @s Pos[1] 1000
execute store result score #z1 skinwalker.temp run data get entity @s Pos[2] 1000

# Phase forward (8 blocks)
execute anchored eyes run tp @s ^ ^ ^8

# Check if player is inside blocks and find safe location if needed
execute unless block ~ ~ ~ #passable unless block ~ ~1 ~ #passable run {
    # Find safe location above
    execute at @s run function skinwalker:abilities/phase_shift/find_safe_spot
}

# Visual effects at destination
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1
particle minecraft:portal ~ ~1 ~ 1 2 1 0.1 100
particle minecraft:witch ~ ~1 ~ 1 2 1 0.1 20

# Short invisibility and resistance
effect give @s minecraft:invisibility 2 0 true
effect give @s minecraft:resistance 2 0 true

# Cooldown feedback
title @s actionbar ["",{"text":"Phase Shift used! ","color":"dark_purple"},{"text":"Cooldown: ","color":"gray"},{"text":"10s","color":"light_purple"}]

# Play enderman scream if near players
execute as @a[distance=0.1..10] at @s run {
    playsound minecraft:entity.enderman.scream player @a ~ ~ ~ 0.5 1.5
}
