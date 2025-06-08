# Play random ambient sounds during phase 2
# Only play if we're still in phase 2
execute unless score #phase skinwalker.phase matches 2 run return 0

# Random chance to play a sound
execute as @a if score #random 1 matches ..5 run {
    # Different sounds based on time of night
    execute if score #time 1 matches 13000..18000 run playsound minecraft:entity.enderman.stare master @s ~ ~ ~ 1 0.8
    execute if score #time 1 matches 18000..22000 run playsound minecraft:entity.phantom.bite master @s ~ ~ ~ 1 0.6
    execute if score #time 1 matches 22000..24000 run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.5 1.0
    
    # Play a random sound at a random location
    execute at @r[type=player] run {
        execute if score #random 1 matches ..3 run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 1.0
        execute if score #random 1 matches 4..6 run playsound minecraft:entity.phantom.hurt master @a ~ ~ ~ 1 1.0
        execute if score #random 1 matches 7..10 run playsound minecraft:entity.warden.heartbeat master @a ~ ~ ~ 1 0.5
    }
}

# Reschedule
schedule function skinwalker:phase2/play_ambient_sounds 10s replace
