# skinwalker:test/bot/ai_tick
# Scheduled function that runs periodically to execute the bot's AI.

# Ensure the bot exists before running its behavior
execute as @e[type=armor_stand,tag=bot_skinwalker,tag=skinwalker] at @s run function skinwalker:test/bot/ai_behavior

# Reschedule itself to create a loop
# The main game tick should handle starting this initially.
# If the bot is removed or game ends, this schedule should be cleared by a cleanup function.
schedule function skinwalker:test/bot/ai_tick 10t # Run AI logic every 0.5 seconds (10 ticks)
