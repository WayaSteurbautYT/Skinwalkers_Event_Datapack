# Handle /disguise command

# Check if player is a Skinwalker
execute unless entity @s[team=Skinwalker] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Only Skinwalkers can use this command!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Check if player is disguised
execute unless entity @s[tag=disguised] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are not currently disguised!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Remove the disguise
function skinwalker:abilities/disguise/remove_disguise
