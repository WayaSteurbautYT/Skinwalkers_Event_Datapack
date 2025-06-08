# Main handler for /disguise command with subcommands

# Check if player is a Skinwalker
execute unless entity @s[team=Skinwalker] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Only Skinwalkers can use this command!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check if game is in progress
execute unless score #game_phase skinwalker.phase matches 1.. run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"The game has not started yet!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check if in phase 2 (disguises disabled in phase 2)
execute if score #game_phase skinwalker.phase matches 2.. run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Disguises are disabled in phase 2!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check for subcommands
execute if score #arguments skinwalker.temp matches 2.. run {
    # Get the subcommand (convert to lowercase for case-insensitive matching)
    data modify storage skinwalker:temp Subcommand set from storage skinwalker:command command 1
    
    # Handle 'remove' subcommand
    execute if data storage skinwalker:temp {Subcommand: "remove"} run function skinwalker:commands/disguise/remove
    
    # Handle 'select' subcommand
    execute if data storage skinwalker:temp {Subcommand: "select"} run function skinwalker:commands/disguise/select
    
    # Handle 'info' subcommand
    execute if data storage skinwalker:temp {Subcommand: "info"} run function skinwalker:commands/disguise/info
    
    # Handle unknown subcommand
    execute unless data storage skinwalker:temp {Subcommand: "remove"} unless data storage skinwalker:temp {Subcommand: "select"} unless data storage skinwalker:temp {Subcommand: "info"} run {
        tellraw @s ["",{"text":"[","color":"red"},{"text":"!","color":"dark_red","bold":true},{"text":"] ","color":"red"},{"text":"Unknown subcommand. Usage:","color":"white"}]
        tellraw @s ["  ",{"text":"/disguise remove","color":"yellow"}," ",{"text":"- Remove your current disguise","color":"gray"}]
        tellraw @s ["  ",{"text":"/disguise select","color":"yellow"}," ",{"text":"- Open the disguise selector","color":"gray"}]
        tellraw @s ["  ",{"text":"/disguise info","color":"yellow"}," ",{"text":"- Show disguise status","color":"gray"}]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    }
} else {
    # No subcommand provided, show help
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Disguise Commands:","color":"white"}]
    tellraw @s ["  ",{"text":"/disguise remove","color":"yellow"}," ",{"text":"- Remove your current disguise","color":"gray"}]
    tellraw @s ["  ",{"text":"/disguise select","color":"yellow"}," ",{"text":"- Open the disguise selector","color":"gray"}]
    tellraw @s ["  ",{"text":"/disguise info","color":"yellow"}," ",{"text":"- Show disguise status","color":"gray"}]
    playsound minecraft:block.note_block.harp player @s ~ ~ ~ 1 1
}
