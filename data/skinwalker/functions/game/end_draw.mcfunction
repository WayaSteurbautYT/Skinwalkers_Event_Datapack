# Handle a draw (time ran out with both teams alive)

# Set game phase to end game
scoreboard players set #game_phase skinwalker.phase 0

# Stop all sounds
stopsound @a

# Play dramatic sound and show title
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 1

title @a title ["",{"text":"TIME'S UP!","color":"dark_red","bold":true}]
title @a subtitle ["",{"text":"No winners this round...","color":"red"}]

# Count final players
execute store result score #survivor_count skinwalker.temp run tag @a[tag=survivor] list
execute store result score #skinwalker_count skinwalker.temp run tag @a[tag=skinwalker] list

# Send final statistics
tellraw @a ["\n\n",{"text":"=== ","color":"dark_red"},{"text":"DRAW","color":"red","bold":true},{"text":" ===\n\n","color":"dark_red"},{"text":"Time ran out with both teams remaining!\n\n","color":"white"},{"text":"Final Standings:\n","color":"yellow"},{"text":"Survivors: ","color":"gray"},{"score":{"name":"#survivor_count","objective":"skinwalker.temp"},"color":"green"},{"text":"  |  ","color":"dark_gray"},{"text":"Skinwalkers: ","color":"gray"},{"score":{"name":"#skinwalker_count","objective":"skinwalker.temp"},"color":"red"}]

# Give participation rewards
execute as @a[tag=survivor] run {
    give @s minecraft:iron_ingot 4
    give @s minecraft:cooked_beef 4
    effect give @s minecraft:regeneration 20 0
}

execute as @a[tag=skinwalker] run {
    give @s minecraft:gold_ingot 4
    give @s minecraft:rotten_flesh 8
    effect give @s minecraft:strength 20 0
}

# Set game mode to spectator for everyone
gamemode spectator @a

# Reset world border
worldborder set 1000000 0

# Schedule game reset in 30 seconds
schedule function skinwalker:game/reset 30s

# Log the draw in console
tellraw @a[tag=op] ["",{"text":"[","color":"dark_gray"},{"text":"Skinwalker","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"text":"Game ended in a draw!","color":"red"}]
