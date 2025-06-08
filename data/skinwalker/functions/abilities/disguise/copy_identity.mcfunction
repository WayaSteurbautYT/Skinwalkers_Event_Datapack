# Executed by the Skinwalker (@s)
# Assumes TargetToCopyUUID and TargetToCopyName are in storage skinwalker:temp

# Attempt to apply disguise using Identity mod (syntax is a placeholder for the actual mod command)
# This command should ideally handle skin and name. If not, name is set manually.
# We'll assume the mod has a way to use a UUID from storage or requires it to be put into a score/NBT first.
# For planning, let's assume a command that can take the UUID directly from storage:
# Example: identity player @s copy SkinAndName fromUUID storage skinwalker:temp TargetToCopyUUID
# If the above isn't possible, one might need to transfer UUID to scoreboard/NBT that the mod can read.

# For now, simulate success and set CustomName manually.
# The actual 'identity' command needs to be researched for the specific mod being used.
tellraw @s {"text":"[DEBUG] Attempting to copy identity from UUID stored in TargetToCopyUUID. Actual mod command needed here.","color":"yellow"}

# Set Skinwalker's CustomName to the target's name
data modify entity @s CustomName set from storage skinwalker:temp TargetToCopyName
data modify entity @s CustomNameVisible set value 1b

# Store the name of the player being disguised as ON THE SKINWALKER for later reference (e.g. in remove_disguise)
data modify entity @s DisguisedAsName set from storage skinwalker:temp TargetToCopyName

# Announce to self
tellraw @s ["",{"text":"You have disguised as ","color":"aqua"},{"storage":"skinwalker:temp","nbt":"TargetToCopyName","color":"yellow","interpret":true}]

# Visual effects for successful disguise
particle minecraft:cloud ~ ~1 ~ 0.5 0.5 0.5 0.1 50
playsound minecraft:entity.illusioner.cast_spell player @s ~ ~ ~ 1 1.5

# Notify nearby players (already handled generally by abilities/disguise/use.mcfunction if global announcement is desired)
# However, a more specific one can be here:
tellraw @a[distance=..20,team=!Skinwalker] ["",{"text":"You see someone change their appearance nearby...","color":"light_purple"}]

# Clean up temp storage if no longer needed by other parts of a sequence
# data remove storage skinwalker:temp TargetToCopyUUID
# data remove storage skinwalker:temp TargetToCopyName
# Decided to keep them for now, might be useful for /say debug or other parts.
}
