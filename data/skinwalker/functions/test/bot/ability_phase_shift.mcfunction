# skinwalker:test/bot/ability_phase_shift
# Simulates the Bot Skinwalker's Phase Shift ability.

# Teleport bot randomly nearby.
# spreadplayers <centerX> <centerZ> <spreadDistance> <maxRange> <respectTeams> <target>
# Using @s to target the bot itself. Spreads from its current location.
# 5 blocks spread distance, 10 blocks max range from current location.
spreadplayers ~ ~ 5 10 false @s

# Play teleport sound to the nearest player
playsound minecraft:entity.enderman.teleport master @p ~ ~ ~ 1.0 1.0

# Show particle effect at the bot's new location
particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 0.1 100

# Notify the nearest player
tellraw @p {"text":"Bot Skinwalker used Phase Shift!","color":"light_purple"}

# Set cooldown for Phase Shift (e.g., 200 ticks = 10 seconds if ai_tick runs every 1 tick)
# The cooldown is managed on the bot entity itself.
# The value here should be number of AI ticks (from ai_behavior) *not* game ticks, unless ai_tick is 1t.
# If ai_tick is 10t, then 20 * 10t = 200 game ticks = 10 seconds.
scoreboard players set @s bot_phase_cooldown 20 # Cooldown of 20 AI ticks (20 * 10 game ticks = 10 seconds)
