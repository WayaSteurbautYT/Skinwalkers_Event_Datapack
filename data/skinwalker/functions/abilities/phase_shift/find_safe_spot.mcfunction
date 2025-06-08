# Find a safe spot to teleport to when phasing into blocks

# Try to find a safe spot above the player (up to 10 blocks up)
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~
execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~

# If still not safe, try to find a safe spot in a spiral pattern
# This helps when phasing into the ground or walls
execute unless block ~ ~ ~ #passable run {
    # Try moving up and to the sides in a spiral
    execute unless block ~ ~ ~ #passable run tp @s ~1 ~1 ~
    execute unless block ~ ~ ~ #passable run tp @s ~-1 ~1 ~
    execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~1
    execute unless block ~ ~ ~ #passable run tp @s ~ ~1 ~-1
    
    # If still stuck, teleport back to original position with a small offset
    execute unless block ~ ~ ~ #passable run {
        tp @s ~ ~2 ~
        title @s title ["",{"text":"Phasing failed!","color":"red"}]
        title @s subtitle ["",{"text":"You were moved to a safe location","color":"gray"}]
    }
}

# Make sure we're not floating in the air (find ground below)
execute if block ~ ~-1 ~ #passable if block ~ ~-2 ~ #passable run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ #passable if block ~ ~-2 ~ #passable run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ #passable if block ~ ~-2 ~ #passable run tp @s ~ ~-1 ~
