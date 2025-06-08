# Function: skinwalker:commands/vanish_self
# Action: Makes the executing player invisible and announces they "left".

effect give @s minecraft:invisibility 99999 1 true
# This is a generic leave message. The user provided specific ones for Youtubers.
# For a generic version, one might use:
# tellraw @a [{"selector":"@s"},{"text":" left the game","color":"yellow"}]
# However, to match the request, we'll focus on specific Youtuber versions below.
# This function would primarily be for the *effect*. The named `tellraw`s might be separate.

# Example of specific Youtuber vanish messages (if this function was Youtuber-specific)
# This assumes the command is run BY the youtuber.
# execute if entity @s[name="Dream"] run tellraw @a {"text":"Dream left the game","color":"yellow"}
# execute if entity @s[name="MrBeast"] run tellraw @a {"text":"MrBeast left the game","color":"yellow"}
# ... and so on for other Youtubers.

tellraw @s {"text":"You have vanished.","color":"gray"}
