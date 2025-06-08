# Event: Part 3 - Final Sequence Kill (Scheduled)

# Kill everyone
# Consider if there are exceptions, e.g., the Skinwalker player(s) themselves.
# For now, killing all players as per the user's notes.
kill @a[gamemode=adventure] # Only kill those in adventure mode to spare spectators or creative admins.
# If all players absolutely must be killed regardless of gamemode: /kill @a

# Final sound
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1

# Schedule the news broadcasts
schedule function skinwalker:events/part3_final/final_sequence_news 2s
