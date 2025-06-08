# Function: skinwalker:game/start_vanilla_placeholder
# Purpose: Called by start_event if Skinwalker gamemode is not selected.
# Provides minimal setup or feedback for a "vanilla-plus" experience.

tellraw @a [{"text":"[Game Admin] ","color":"gold"},{"text":"Skinwalker gamemode is not active for this session.","color":"yellow"}]
tellraw @a [{"text":"Enjoy a Vanilla-Plus experience! To play Skinwalkers, an admin can run: ","color":"gray"},{"text":"/function skinwalker:commands/select_gamemode_skinwalker","color":"aqua"}]

# Optional: Basic setup for a vanilla game if desired
# time set day
# weather clear
# gamemode survival @a
# etc.

# For now, it just messages. The server admin can customize this for their desired default experience.
