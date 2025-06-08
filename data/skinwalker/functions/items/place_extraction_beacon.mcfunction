# Handle extraction beacon placement for YouTubers
# This runs when a YouTuber places an extraction beacon

# Check if the player is a YouTuber with completed tasks
execute if entity @s[tag=youtuber,tag=tasks_completed] run {
    # Play sound and particle effects
    playsound minecraft:block.beacon.activate block @a ~ ~ ~ 1 1
    particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 50
    particle minecraft:witch ~ ~1 ~ 0.5 2 0.5 0.1 100
    
    # Create extraction zone (5x5 area)
    fill ~-2 ~-1 ~-2 ~2 ~3 ~2 minecraft:blue_stained_glass replace air
    fill ~-2 ~ ~-2 ~2 ~ ~2 minecraft:light_blue_stained_glass replace blue_stained_glass
    
    # Set extraction timer (30 seconds)
    scoreboard players set #extraction_timer skinwalker.temp 600
    
    # Notify all players
    title @a title ["",{"text":"EXTRACTION BEACON PLACED!","color":"aqua","bold":true}]
    title @a subtitle ["",{"text":"YouTubers will be extracted in 30 seconds!","color":"dark_aqua"}]
    
    # Start extraction countdown
    function skinwalker:game/start_extraction_countdown
    
    # Prevent beacon from being placed
    setblock ~ ~ ~ air
    
    # Give the player back their beacon if they're still alive
    execute unless entity @s[tag=dead] run {
        give @s minecraft:beacon{display:{Name:'{"text":"Extraction Beacon","color":"gold","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2002} 1
    }
} else execute if entity @s[tag=!tasks_completed] run {
    # Player hasn't completed tasks yet
    title @s title ["",{"text":"TASKS NOT COMPLETE!","color":"red","bold":true}]
    title @s subtitle ["",{"text":"Complete all your tasks first!","color":"dark_red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    
    # Give the beacon back
    give @s minecraft:beacon{display:{Name:'{"text":"Extraction Beacon","color":"gold","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:2002} 1
    
    # Prevent beacon placement
    setblock ~ ~ ~ air
}
