# Event: Part 3 - Final Sequence Start

# Set everyone to adventure mode
gamemode adventure @a

# Force everyone to the End (ensure players are loaded before tp for safety, though tp usually handles it)
# Consider adding a brief delay or a "teleporting in 5 seconds" message if abruptness is an issue.
execute in minecraft:the_end run tp @a 0 100 0 0 0 # Teleport to a specific spot in the End, facing North

# Play two messages and sound
title @a title {"text":"The End Begins","color":"dark_red","bold":true}
# Subtitle can be added here if needed, or use a separate title command after a delay.
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.8

# Schedule the next part of the sequence
schedule function skinwalker:events/part3_final/final_sequence_messages 3s
