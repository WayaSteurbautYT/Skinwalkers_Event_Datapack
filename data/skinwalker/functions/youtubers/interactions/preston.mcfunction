# Preston's interaction - Challenge
tellraw @a ["",{"text":"[PrestonPlayz]","color":"gold"},{"text":" Don't touch the red wool! Last one standing wins!"}]

# Create a challenge area with red wool
fill ~-5 ~-1 ~-5 ~5 ~-1 ~5 minecraft:red_wool replace minecraft:air
fill ~-5 ~ ~-5 ~5 ~4 ~5 minecraft:air replace minecraft:air

# Give all players an advancement
title @a title ["",{"text":"Challenge Started!","color":"gold"}]
title @a subtitle ["",{"text":"Red Wool Challenge","color":"red"}]
