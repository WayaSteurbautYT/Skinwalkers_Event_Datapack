# Create a colorful firework show for victory celebrations
# This creates a ring of fireworks around each player

execute as @a run {
    # Create a ring of fireworks around each player
    execute at @s run {
        # Front
        summon firework_rocket ~1 ~ ~ {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Colors:[16711680],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Back
        summon firework_rocket ~-1 ~ ~ {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[65280],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Left
        summon firework_rocket ~ ~ ~1 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Colors:[255],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Right
        summon firework_rocket ~ ~ ~-1 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Colors:[16776960],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        
        # Diagonal positions
        summon firework_rocket ~0.7 ~ ~0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[16711935],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~0.7 ~ ~-0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[65535],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~-0.7 ~ ~0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[16711680],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~-0.7 ~ ~-0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[255],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
    }
    
    # Play firework sounds
    playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 1 1
    
    # Schedule next wave if game is still in celebration
    execute if score #game_active skinwalker.phase matches 0 run schedule function skinwalker:game/firework_show 1s
}
