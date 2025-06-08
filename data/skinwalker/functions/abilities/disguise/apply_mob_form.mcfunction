# Function: skinwalker:abilities/disguise/apply_mob_form
# Expected to be called with parameters: function skinwalker:abilities/disguise/apply_mob_form {"mob":"<mob_id>", "name":"<display_name>"}
# Requires Minecraft 1.20.2+ for function macros.

# $(mob) and $(name) are placeholders for the actual macro values.

# Set disguise duration timer (e.g., 30 seconds) - same as other flows
scoreboard players set @s skinwalker.disguise_timer 600

# The actual /identity or /disguise command syntax depends on the server plugin.
# Using a generic placeholder for "Identity" mod.
# Example for LibsDisguises: /disguise $(mob)
identity equip @s $(mob)
# For some mob disguise plugins, you might need to specify player name: /disguiseplayer @s $(mob)

# Set CustomName for consistency (though mobs usually don't show player names)
# Some plugins might automatically hide name for mob disguises.
# data merge entity @s {CustomName:'"$(name)"', CustomNameVisible:0b} # Usually hidden for mobs
# For now, let's not set CustomName for mobs, as it might interfere with the mob disguise.
# The DisguisedAsName NBT will hold the "name" of the mob form for UI purposes.

tag @s add disguised # General disguised tag
tag @s add disguised_as_mob # Specific tag for mob disguise

# Store the chosen name for removal message
data modify entity @s DisguisedAsName set value "$(name)"

tellraw @s ["",{"text":"Transformed into: ","color":"green"},{"text":"$(name)","color":"yellow"}]
playsound minecraft:entity.zombie_villager.converted master @s ~ ~ ~ 1 0.8 # Example sound

# The main cooldown was already set when opening the first menu.
# remove_disguise should handle clearing mob forms via /identity unequip, /identity reset, or /undisguise.
