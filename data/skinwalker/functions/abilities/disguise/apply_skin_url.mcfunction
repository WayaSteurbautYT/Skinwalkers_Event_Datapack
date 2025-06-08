# Function: skinwalker:abilities/disguise/apply_skin_url
# Expected to be called with parameters: function skinwalker:abilities/disguise/apply_skin_url {"url":"<url>", "name":"<display_name>"}
# Requires Minecraft 1.20.2+ for function macros.

# $(url) and $(name) are placeholders for the actual macro values.

# Set disguise duration timer (e.g., 30 seconds) - same as copy_identity flow
scoreboard players set @s skinwalker.disguise_timer 600

# The actual /skin command syntax depends on the server plugin.
# Using a generic placeholder. Replace with actual command.
# Example for SkinsRestorer: /skin set $(name) $(url)
# Example for CustomSkins: /skin url @s $(url)
skin player @s set $(url)
# identity player @s skin url:$(url) # Alternative syntax for some plugins like "Identity"

# Set CustomName for consistency
data merge entity @s {CustomName:'"$(name)"', CustomNameVisible:1b}
tag @s add disguised # General disguised tag
tag @s add disguised_as_player # Specific tag for player skin disguise

# Store the chosen name for removal message, similar to copy_identity
data modify entity @s DisguisedAsName set value "$(name)"

tellraw @s ["",{"text":"Skin applied: ","color":"green"},{"text":"$(name)","color":"yellow"}]
playsound minecraft:item.armor.equip_leather master @s ~ ~ ~ 1 1.2

# The main cooldown was already set when opening the first menu.
# remove_disguise should handle clearing CustomName and resetting skin via /identity reset or /skin clear.
