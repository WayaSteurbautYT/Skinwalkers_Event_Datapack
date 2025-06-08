# skinwalker:test/bot/ai_behavior
# Main AI logic for the Bot Skinwalker. Executed by ai_tick.

# --- Target Acquisition & Movement ---
# Target the nearest player survivor/youtuber. For simplicity, we'll use @p without specific survivor/youtuber tags here.
# In a more complex setup, you'd ensure @p is a valid target.
# For testing, @p is likely the single player in the test mode.

# Make bot face player if player is within 10 blocks
execute if entity @p[distance=..10] run tp @s ~ ~ ~ facing entity @p feet

# Move bot forward towards where it's facing if player is further than 3 blocks
# The '^ ^ ^0.5' moves it 0.5 blocks in its local forward direction. Adjust speed as needed.
# Ensure it only moves if a player is detected to prevent wandering if player is far or in spectator.
execute if entity @p[distance=3..] run tp @s ^ ^ ^0.5

# --- Ability Usage ---
# Claw Attack Simulation: If player is close (e.g., within 2.9 blocks)
execute if entity @p[distance=..2.9] run function skinwalker:test/bot/ability_claw_attack

# Phase Shift Simulation (Periodically)
# Check cooldown. The objective 'bot_phase_cooldown' is managed on the bot entity itself.
execute if score @s bot_phase_cooldown matches 0 run function skinwalker:test/bot/ability_phase_shift

# Decrement phase shift cooldown if it's > 0
execute if score @s bot_phase_cooldown matches 1.. run scoreboard players remove @s bot_phase_cooldown 10 # Corresponds to 10 ticks from ai_tick

# --- Debug ---
# title @p actionbar {"selector":"@s","nbt":"Pos[0]"} # Optional: Show bot's X position to player for debug
