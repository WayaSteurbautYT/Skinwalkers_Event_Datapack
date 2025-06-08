# skinwalker:test/bot/ability_claw_attack
# Simulates the Bot Skinwalker's Claw Attack.

# Play attack sound to the targeted player
# Ensure it's targeted at the player the bot is attacking (assumed to be @p in this context)
playsound minecraft:entity.player.attack.sweep master @p ~ ~ ~ 1.0 1.2

# Apply a brief Weakness effect to simulate a hit.
# Adjust duration and amplifier as needed.
effect give @p minecraft:weakness 1 0 true

# Send a message to the player
tellraw @p {"text":"Bot Skinwalker used Claw Attack! You've been hit!","color":"red"}

# Optional: Add a very short cooldown for this specific attack if needed,
# e.g., scoreboard players set @e[type=armor_stand,tag=bot_skinwalker,limit=1] bot_claw_cooldown 10 # 0.5s
# The main AI tick rate and distance check already provide some level of rate limiting.
