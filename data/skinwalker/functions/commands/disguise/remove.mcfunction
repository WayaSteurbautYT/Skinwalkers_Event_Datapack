# Handle /disguise remove command

# Check if player is disguised
execute unless entity @s[tag=disguised] run {
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are not currently disguised!","color":"red"}]
    playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
    return 0
}

# Store the target's name for the message
data modify storage skinwalker:temp DisguiseName set from entity @s DisguiseName

# Remove the disguise
function skinwalker:abilities/disguise/remove_disguise

# Notify the player
tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You removed your ","color":"red"},{"text":"","color":"red"},{"storage":"skinwalker:temp","nbt":"DisguiseName","interpret":true,"color":"yellow"},{"text":" disguise!","color":"red"}]

# Play sound effect
playsound minecraft:entity.illusioner.mirror_move player @s ~ ~ ~ 1 1

# Add a cooldown (30 seconds)
scoreboard players set @s skinwalker.ability_cooldown 600

# Notify nearby players (within 20 blocks)
execute as @a[distance=..20,sort=nearest,limit=1] at @s run {
    tellraw @a[distance=..20] ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"selector":"@s"},{"text":" has removed their disguise!","color":"red"}]
    playsound minecraft:entity.illusioner.prepare_mirror player @a[distance=..20] ~ ~ ~ 1 1
}

# Clear temporary storage
data remove storage skinwalker:temp DisguiseName
