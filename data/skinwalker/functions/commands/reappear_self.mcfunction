# Function: skinwalker:commands/reappear_self
# Action: Makes the executing player visible and announces they "joined".

effect clear @s minecraft:invisibility
# Similar to vanish, generic join vs specific Youtuber join.
# tellraw @a [{"selector":"@s"},{"text":" joined the game","color":"yellow"}]

# execute if entity @s[name="Dream"] run tellraw @a {"text":"Dream joined the game","color":"yellow"}
# execute if entity @s[name="MrBeast"] run tellraw @a {"text":"MrBeast joined the game","color":"yellow"}
# ... and so on for other Youtubers.

tellraw @s {"text":"You have reappeared.","color":"gray"}
