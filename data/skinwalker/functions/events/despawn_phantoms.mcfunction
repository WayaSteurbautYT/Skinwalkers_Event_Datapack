# Despawn phantoms that were spawned by an event

# Kill all phantoms with the event_mob tag
kill @e[type=minecraft:phantom,tag=event_mob]

# Play a fade-out effect
execute as @a[tag=survivor] at @s run {
    particle minecraft:large_smoke ~ ~2 ~ 5 2 5 0.1 100 force @a[distance=..32]
}

# Notify players
tellraw @a ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple","bold":true},{"text":"] ","color":"dark_purple"},{"text":"The phantoms fade back into the night...","color":"gray"}]
