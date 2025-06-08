# Use Claws ability - Slash at nearby survivors and potentially infect them

# Check cooldown
scoreboard players get #claws_cooldown skinwalker.claws_cooldown
scoreboard players operation #claws_cooldown skinwalker.claws_cooldown = @s skinwalker.claws_cooldown

# If on cooldown, show message and return
execute if score #claws_cooldown skinwalker.claws_cooldown matches 1.. run {
    title @s actionbar ["",
        {"text":"[","color":"dark_red"},
        {"text":"!","color":"red","bold":true},
        {"text":"] ","color":"dark_red"},
        {"text":"Claws cooldown: ","color":"red"},
        {"score":{"name":"#claws_cooldown","objective":"skinwalker.claws_cooldown"},"color":"gold"},
        {"text":"s","color":"red"}
    ]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Set cooldown
scoreboard players operation @s skinwalker.claws_cooldown = @s skinwalker.claws_cooldown_max

# Find and attack closest survivor
execute as @p[limit=1,sort=nearest,distance=..5,team=!Skinwalker] at @s run {
    # Check if target is a YouTuber (immune to infection)
    execute if entity @s[tag=!youtuber] run {
        # 30% chance to infect a survivor
        scoreboard players set #random skinwalker.temp 0
        scoreboard players set #random skinwalker.temp 1..3
        execute if score #random skinwalker.temp matches 1 run {
            # Convert survivor to Skinwalker
            function skinwalker:convert_to_skinwalker
            
            # Special effects for conversion
            particle minecraft:witch ~ ~1 ~ 0.5 2 0.5 0.1 50
            particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 20
            playsound minecraft:entity.evoker.prepare_wololo player @a ~ ~ ~ 1 1
            playsound minecraft:entity.ender_dragon.growl player @a ~ ~ ~ 1 0.5
            
            # Notify all players
            tellraw @a ["",
                {"text":"☠ ","color":"dark_red","bold":true},
                {"selector":"@s"},
                {"text":" has been infected by ","color":"red"},
                {"selector":"@p[tag=skinwalker,limit=1,sort=nearest,distance=..5]"},
                {"text":" and became a Skinwalker!","color":"red"}
            ]
            
            # Skip damage since they're now a Skinwalker
            return 0
        }
    }
    
    # If not infected, deal damage and apply effects
    damage @s 6 minecraft:player_attack
    
    # Apply slowness and weakness
    effect give @s minecraft:slowness 5 1
    effect give @s minecraft:weakness 5 0
    effect give @s minecraft:glowing 5 0 true
    
    # Blood particles
    particle minecraft:dust 1 0 0 1 ~ ~1 ~ 0.5 1 0.5 0.1 30 force
    particle minecraft:damage_indicator ~ ~1 ~ 0.5 1 0.5 0.1 10 force
    
    # Message to victim
    title @s title ["",{"text":"YOU'VE BEEN SLASHED!","color":"dark_red","bold":true}]
    title @s subtitle ["",{"text":"You feel the infection spreading...","color":"red"}]
    
    # Play hurt sound to victim
    playsound minecraft:entity.player.hurt player @s ~ ~ ~ 1 1
}

# Play sound effects
playsound minecraft:entity.phantom.bite player @a ~ ~ ~ 1 0.8
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 1
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 1.2

# Visual effects
particle minecraft:sweep_attack ~ ~1 ~ 0.5 1 0.5 0.1 15
particle minecraft:soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.1 30
particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 20

# Cooldown feedback
title @s actionbar ["",
    {"text":"[","color":"dark_red"},
    {"text":"✓","color":"green","bold":true},
    {"text":"] ","color":"dark_red"},
    {"text":"Claws used! ","color":"red"},
    {"text":"(","color":"gray"},
    {"text":"5s cooldown","color":"yellow"},
    {"text":")","color":"gray"}
]

# Message to nearby survivors
tellraw @a[team=!Skinwalker,distance=..15] ["",
    {"text":"[","color":"dark_red"},
    {"text":"!","color":"red","bold":true},
    {"text":"] ","color":"dark_red"},
    {"text":"You hear a sickening slash...","color":"red"}
]

# Message to other Skinwalkers
tellraw @a[team=Skinwalker,distance=..30] ["",
    {"text":"[","color":"dark_red"},
    {"text":"SKINWALKER","color":"red","bold":true},
    {"text":"] ","color":"dark_red"},
    {"selector":"@s"},
    {"text":" has attacked a survivor!","color":"red"}
]
