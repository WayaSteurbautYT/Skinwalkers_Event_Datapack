# Handle the extraction countdown for YouTubers
# This runs every second during the extraction countdown

# Decrement timer
scoreboard players remove #extraction_timer skinwalker.temp 1

# Show countdown in action bar
execute if score #extraction_timer skinwalker.temp matches 1.. run {
    # Calculate minutes and seconds
    scoreboard players operation #minutes skinwalker.temp = #extraction_timer skinwalker.temp
    scoreboard players operation #minutes skinwalker.temp /= 20 skinwalker.temp
    scoreboard players operation #seconds skinwalker.temp = #extraction_timer skinwalker.temp
    scoreboard players operation #seconds skinwalker.temp %= 20 skinwalker.temp
    
    # Format time as MM:SS
    execute if score #seconds skinwalker.temp matches 0 run scoreboard players set #seconds skinwalker.temp 0
    execute if score #seconds skinwalker.temp matches 1 run scoreboard players set #seconds skinwalker.temp 5
    execute if score #seconds skinwalker.temp matches 2 run scoreboard players set #seconds skinwalker.temp 10
    execute if score #seconds skinwalker.temp matches 3 run scoreboard players set #seconds skinwalker.temp 15
    
    # Show countdown in action bar
    title @a actionbar ["",
        {"text":"[","color":"aqua"},
        {"text":"⏱","color":"dark_aqua"},
        {"text":"] ","color":"aqua"},
        {"text":"Extraction in ","color":"green"},
        {"score":{"name":"#minutes","objective":"skinwalker.temp"},"color":"yellow"},
        {"text":":","color":"white"},
        {"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"yellow"},
        {"text":" ","color":"white"},
        {"text":"(","color":"gray"},
        {"selector":"@a[tag=youtuber,tag=tasks_completed,limit=1,sort=nearest]"},
        {"text":"'s beacon)","color":"gray"}
    ]
    
    # Play countdown sounds at certain intervals
    execute if score #extraction_timer skinwalker.temp matches 100..119 run playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 1.5
    execute if score #extraction_timer skinwalker.temp matches 60..79 run playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 1.5
    execute if score #extraction_timer skinwalker.temp matches 40..59 run playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 1.5
    
    # Last 10 seconds
    execute if score #extraction_timer skinwalker.temp matches 1..20 run {
        playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1 2
        
        # Show title for last 5 seconds
        execute if score #extraction_timer skinwalker.temp matches 1..5 run {
            title @a title ["",
                {"text":"EXTRACTION IN ","color":"aqua","bold":true},
                {"score":{"name":"#extraction_timer","objective":"skinwalker.temp"},"color":"yellow","bold":true}
            ]
            title @a subtitle ["",{"text":"Protect the YouTubers!","color":"dark_aqua"}]
        }
    }
    
    # Reschedule for next tick
    schedule function skinwalker:game/extraction_countdown 1s replace
}

# Extraction complete
execute if score #extraction_timer skinwalker.temp matches ..0 run {
    # Play extraction complete sound
    playsound minecraft:entity.ender_dragon.growl block @a ~ ~ ~ 1 0.5
    playsound minecraft:ui.toast.challenge_complete block @a ~ ~ ~ 1 1
    
    # Create explosion effect
    execute at @a[tag=youtuber,tag=tasks_completed] run {
        particle minecraft:explosion_emitter ~ ~1 ~ 0.5 1 0.5 0.1 50
        particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 100
    }
    
    # Teleport YouTubers to extraction point (spawn)
    execute as @a[tag=youtuber,tag=tasks_completed] at @s run {
        effect give @s minecraft:instant_health 1 1
        effect give @s minecraft:regeneration 5 1
        effect give @s minecraft:glowing 10 0 true
        
        # Give win rewards
        give @s minecraft:netherite_ingot{display:{Name:'{"text":"Extraction Reward","color":"gold","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:3}],CustomModelData:2003} 1
        
        # Add win tag
        tag @s add winner
        
        # Remove from game
        gamemode spectator @s
    }
    
    # Notify all players
    title @a title ["",{"text":"EXTRACTION COMPLETE!","color":"green","bold":true}]
    title @a subtitle ["",{"text":"The YouTubers have escaped!","color":"aqua"}]
    
    # Check win conditions
    function skinwalker:game/check_win_conditions
}
