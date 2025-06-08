# Apply random effects to players
# This can be beneficial or harmful, adding unpredictability

# Select a random effect type (1-10)
scoreboard players set #effect_type skinwalker.temp 1..10

# Effect 1-3: Beneficial effects
execute if score #effect_type skinwalker.temp matches 1..3 run {
    # Select a random beneficial effect
    scoreboard players set #effect skinwalker.temp 1..5
    
    # Apply the effect to all survivors
    execute as @a[tag=survivor] at @s run {
        # Speed
        execute if score #effect skinwalker.temp matches 1 run effect give @s minecraft:speed 30 0
        # Strength
        execute if score #effect skinwalker.temp matches 2 run effect give @s minecraft:strength 20 0
        # Regeneration
        execute if score #effect skinwalker.temp matches 3 run effect give @s minecraft:regeneration 10 0
        # Jump Boost
        execute if score #effect skinwalker.temp matches 4 run effect give @s minecraft:jump_boost 20 1
        # Resistance
        execute if score #effect skinwalker.temp matches 5 run effect give @s minecraft:resistance 30 0
        
        # Play positive effect sound
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
    }
    
    # Notify players
    tellraw @a ["",{"text":"[","color":"dark_aqua"},{"text":"!","color":"aqua","bold":true},{"text":"] ","color":"dark_aqua"},{"text":"A surge of energy flows through the survivors!","color":"white"}]
}

# Effect 4-6: Harmful effects
execute if score #effect_type skinwalker.temp matches 4..6 run {
    # Select a random harmful effect
    scoreboard players set #effect skinwalker.temp 1..5
    
    # Apply the effect to all survivors
    execute as @a[tag=survivor] at @s run {
        # Slowness
        execute if score #effect skinwalker.temp matches 1 run effect give @s minecraft:slowness 20 0
        # Weakness
        execute if score #effect skinwalker.temp matches 2 run effect give @s minecraft:weakness 30 0
        # Poison
        execute if score #effect skinwalker.temp matches 3 run effect give @s minecraft:poison 10 0
        # Nausea
        execute if score #effect skinwalker.temp matches 4 run effect give @s minecraft:nausea 15 0
        # Blindness
        execute if score #effect skinwalker.temp matches 5 run effect give @s minecraft:blindness 10 0
        
        # Play negative effect sound
        playsound minecraft:entity.ender_man.scream ambient @s ~ ~ ~ 0.5 1.5
    }
    
    # Notify players
    tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"A dark energy affects the survivors!","color":"red"}]
}

# Effect 7-8: Mixed effects (both good and bad)
execute if score #effect_type skinwalker.temp matches 7..8 run {
    # Apply a positive effect to half the survivors and negative to the other half
    execute as @a[tag=survivor,sort=random,limit=1] at @s run {
        # Give positive effect
        effect give @s minecraft:speed 30 1
        effect give @s minecraft:jump_boost 30 0
        playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
        title @s title ["",{"text":"EMPOWERED!","color":"green"}]
    }
    
    execute as @a[tag=survivor,sort=random,limit=1] at @s run {
        # Give negative effect
        effect give @s minecraft:slowness 30 0
        effect give @s minecraft:weakness 30 0
        playsound minecraft:entity.ender_man.scream ambient @s ~ ~ ~ 0.5 1.5
        title @s title ["",{"text":"WEAKENED!","color":"red"}]
    }
    
    # Notify players
    tellraw @a ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple","bold":true},{"text":"] ","color":"dark_purple"},{"text":"The energy shifts unpredictably...","color":"purple"}]
}

# Effect 9-10: No effect, just a spooky message
execute if score #effect_type skinwalker.temp matches 9..10 run {
    # Just a spooky sound and message
    playsound minecraft:entity.ender_dragon.growl ambient @a ~ ~ ~ 0.5 1
    tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"gray","bold":true},{"text":"] ","color":"dark_gray"},{"text":"You feel a strange presence watching you...","color":"gray"}]
}
