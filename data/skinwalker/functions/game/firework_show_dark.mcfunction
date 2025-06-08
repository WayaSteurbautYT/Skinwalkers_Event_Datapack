# Create a dark-themed firework show for Skinwalker victory
# This creates a ring of dark and red fireworks around each player

execute as @a run {
    # Create a ring of fireworks around each player
    execute at @s run {
        # Front
        summon firework_rocket ~1 ~ ~ {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:0,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Back
        summon firework_rocket ~-1 ~ ~ {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Left
        summon firework_rocket ~ ~ ~1 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        # Right
        summon firework_rocket ~ ~ ~-1 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        
        # Diagonal positions
        summon firework_rocket ~0.7 ~ ~0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~0.7 ~ ~-0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~-0.7 ~ ~0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        summon firework_rocket ~-0.7 ~ ~-0.7 {LifeTime:30,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[11141120],FadeColors:[0],Flicker:1,Trail:1}],Flight:2}}}}
        
        # Add some soul fire particles
        particle minecraft:soul_fire_flame ~ ~1 ~ 1 2 1 0.1 20
    }
    
    # Play firework sounds with lower pitch for a more ominous feel
    playsound minecraft:entity.firework_rocket.launch player @a ~ ~ ~ 0.8 0.8
    
    # Schedule next wave if game is still in celebration
    execute if score #game_active skinwalker.phase matches 0 run schedule function skinwalker:game/firework_show_dark 1.5s
}
