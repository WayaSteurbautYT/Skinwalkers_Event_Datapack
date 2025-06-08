# Event: Part 3 - Final Sequence Messages (Scheduled)

tellraw @a {"text":"[Skinwalker] I used all their faces. Now I wear yours.","color":"dark_red"}

# Second title sequence
title @a title {"text":"You Let Him In","color":"dark_red","bold":true}
title @a subtitle {"text":"Now… the world ends.","color":"gray"}

# Schedule the kill command
schedule function skinwalker:events/part3_final/final_sequence_kill 4s
