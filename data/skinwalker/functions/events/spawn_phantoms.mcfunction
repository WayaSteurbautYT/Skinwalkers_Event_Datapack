# Spawn phantoms around random players
# This creates a spooky atmosphere during the night phase

execute as @r[tag=survivor] at @s run {
    # Spawn 2-4 phantoms in a circle around the player
    execute at @s positioned ~ ~5 ~ run summon minecraft:phantom ~2 ~ ~ {Tags:["event_mob"],Health:20.0f,Attributes:[{Name:generic.max_health,Base:20.0}],ActiveEffects:[{Id:14,Duration:200,Amplifier:0,ShowParticles:0b}]}
    execute at @s positioned ~ ~5 ~ run summon minecraft:phantom ~-2 ~ ~ {Tags:["event_mob"],Health:20.0f,Attributes:[{Name:generic.max_health,Base:20.0}],ActiveEffects:[{Id:14,Duration:200,Amplifier:0,ShowParticles:0b}]}
    execute if score #random 1 matches ..50 run at @s positioned ~ ~5 ~ run summon minecraft:phantom ~ ~ ~2 {Tags:["event_mob"],Health:20.0f,Attributes:[{Name:generic.max_health,Base:20.0}],ActiveEffects:[{Id:14,Duration:200,Amplifier:0,ShowParticles:0b}]}
    
    # Play spooky sound
    playsound minecraft:entity.phantom.ambient master @a ~ ~ ~ 1 0.8
    
    # Notify players
    title @a[sort=nearest,limit=5] title ["",{"text":"Phantoms approach!","color":"dark_purple"}]
    tellraw @a ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple","bold":true},{"text":"] ","color":"dark_purple"},{"text":"You hear the flapping of spectral wings...","color":"gray"}]
}

# Despawn phantoms after 60 seconds
schedule function skinwalker:events/despawn_phantoms 60s replace
