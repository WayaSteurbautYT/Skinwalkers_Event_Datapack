# skinwalker:test/start_youtuber_vs_bot
# Sets up a single-player test mode: Player (as Survivor/YouTuber) vs. Bot Skinwalker.

# --- Game Reset and Setup ---
# Run general game reset (ensure this function properly clears old states, entities, schedules)
# The prompt mentioned skinwalker:reset, using that.
function skinwalker:reset
# If skinwalker:reset doesn't handle scoreboard setup, call it separately.
# The prompt mentioned skinwalker:setup_scoreboard, using that.
function skinwalker:setup_scoreboard

# --- Assign Player Role ---
# The player starting the test (@s, which is @p in command block context) becomes the Survivor.
# For YouTuber testing, change to skinwalker:roles/become_youtuber and team join YouTubers.
execute as @p run function skinwalker:roles/become_survivor
execute as @p run team join Survivors @s # Or 'team join YouTubers @s'
execute as @p run tag @s add survivor # Ensure player has survivor tag for systems that use it

# Clear all effects and set to survival, full health/food
effect clear @p
gamemode survival @p
effect give @p minecraft:saturation 20 255 true
effect give @p minecraft:health_boost 0 # Resets max health to normal before applying regen
effect give @p minecraft:instant_health 1 255 true # Full heal


tellraw @p {"text":"You are the Survivor! Prepare to face the Bot Skinwalker.","color":"green"}

# --- Spawn and Initialize Bot ---
# Spawn the Bot Skinwalker
function skinwalker:test/bot/spawn_skinwalker_bot

# Initialize Bot AI Cooldowns (ensure bot is spawned before this)
# Target the bot specifically. It should have 'bot_skinwalker' tag from its spawn function.
scoreboard players set @e[type=armor_stand,tag=bot_skinwalker,tag=skinwalker,limit=1] bot_phase_cooldown 0

# --- Start Game Systems ---
# Set game phase (assuming phase 1 is the active gameplay phase)
scoreboard players set #phase skinwalker.phase 1
# Announce game start for testing mode
tellraw @a {"text":"Skinwalker Test Mode: YouTuber vs Bot Activated!","color":"gold"}

# Start main game tick (if not already started by skinwalker:reset or if it needs specific timing)
# The prompt mentioned skinwalker:game/tick.
# Ensure this doesn't conflict with existing schedules or that skinwalker:reset clears them.
schedule function skinwalker:game/tick 1s replace

# Start Bot AI tick (creates a separate loop for the bot AI)
# This schedule should also be cleared by skinwalker:reset or a specific test mode cleanup function.
schedule function skinwalker:test/bot/ai_tick 10t replace # Start AI ticks, e.g., every 0.5 seconds

# --- Environment Setup (Optional) ---
time set day
weather clear
give @p minecraft:stone_sword 1
give @p minecraft:cooked_beef 16
# Optional: Teleport player to a specific test arena
# tp @p X Y Z

# Final message
tellraw @p {"text":"The test environment is set. The Bot Skinwalker is active. Good luck!","color":"yellow"}
