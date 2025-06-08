# Function: skinwalker:start_trigger_handler
# Called by: game/tick when a player uses /trigger skinwalker_start
# Action: Runs the main start_event function and resets the trigger.

# Log who started the event (optional)
# tellraw @a [{"text":"Event started by: ","color":"gray"},{"selector":"@s","color":"yellow"}]

# Run the main event start function
function skinwalker:start_event

# Reset the trigger for the player who used it
scoreboard players set @s skinwalker_trigger 0

# Disable the trigger for this player to prevent accidental re-triggering immediately
# They can re-enable it via /trigger skinwalker_start enable (or load.mcfunction could re-enable for all periodically if needed)
# scoreboard players disable @s skinwalker_trigger
# For now, just resetting is fine. Enabling is handled by load.mcfunction for new players.
# The trigger objective type itself prevents non-OPs from setting it to values other than 0 or 1 via /scoreboard.
# /trigger command sets it to 1.
