# Handle disguise selection cancellation

# Check if player is currently selecting a disguise
execute unless entity @s[tag=selecting_disguise] run return 0

# Notify player
title @s title ["",{"text":"Disguise Cancelled","color":"red"}]
title @s subtitle ["",{"text":"Right-click the disguise selector to try again","color":"gray"}]

# Clear selection tags
tag @s remove selecting_disguise
tag @s remove disguise_option_*

# Play sound
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
