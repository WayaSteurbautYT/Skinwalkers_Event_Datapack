# Handle /disguise select command

# Check cooldown
execute if score @s skinwalker.ability_cooldown matches 1.. run {
    # Calculate remaining seconds
    scoreboard players operation #seconds skinwalker.temp = @s skinwalker.ability_cooldown
    scoreboard players operation #seconds skinwalker.temp /= 20 const
    scoreboard players add #seconds skinwalker.temp 1
    
    # Show cooldown message
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Disguise ability is on cooldown for ","color":"red"},{"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":" seconds","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check if already disguised
execute if entity @s[tag=disguised] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You're already disguised! Use ","color":"red"},{"text":"/disguise remove","color":"yellow"},{"text":" first.","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check for nearby survivors
execute unless entity @a[team=survivors,distance=..20,limit=1] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"No survivors nearby to disguise as!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Open the disguise selector
execute as @s run function skinwalker:items/disguise_selector
