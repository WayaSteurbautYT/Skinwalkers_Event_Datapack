# Create a single lightning strike as part of the storm

# Find a random survivor to strike near
execute as @r[tag=survivor] at @s run {
    # Random offset 5-15 blocks away
    scoreboard players set #offset skinwalker.temp 5
    scoreboard players add #offset skinwalker.temp 0..10
    
    # Random angle (0-360 degrees)
    scoreboard players set #angle skinwalker.temp 0..359
    
    # Calculate position
    execute store result score #x skinwalker.temp run scoreboard players get #offset skinwalker.temp
    scoreboard players operation #x skinwalker.temp *= #angle skinwalker.temp
    scoreboard players operation #x skinwalker.temp /= 90 const
    
    execute store result score #z skinwalker.temp run scoreboard players get #offset skinwalker.temp
    scoreboard players operation #z skinwalker.temp *= #angle skinwalker.temp
    scoreboard players add #z skinwalker.temp 90
    scoreboard players operation #z skinwalker.temp %= 360 const
    scoreboard players operation #z skinwalker.temp /= 90 const
    
    # Create the lightning strike
    execute positioned ~#x ~ ~#z run summon minecraft:lightning_bolt ~ ~ ~ {Tags:["event_lightning"]}
    
    # Play sound
    playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1
    
    # Visual effect
    particle minecraft:flash ~ ~ ~ 0 0 0 0.1 1 force @a[distance=..32]
    
    # Small chance to set blocks on fire
    execute if score #random 1 matches ..20 run setblock ~ ~ ~ minecraft:fire
}
