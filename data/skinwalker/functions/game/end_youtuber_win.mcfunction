# Handle YouTuber victory (completed all tasks and escaped)

# Set game phase to end game
scoreboard players set #game_phase skinwalker.phase 0

# Stop all sounds
stopsound @a

# Play special victory sound and show title
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.5
playsound minecraft:entity.player.level_up master @a ~ ~ ~ 1 1.5

title @a title ["",{"text":"YOUTUBER ESCAPED!","color":"blue","bold":true}]
title @a subtitle ["",{"text":"The truth will be revealed...","color":"dark_blue"}]

# Special effects for the YouTuber
execute as @a[tag=youtuber] run {
    # Give special rewards
    give @s minecraft:nether_star{display:{Name:'{"text":"Legendary YouTuber Trophy","color":"gold","italic":false}'}} 1
    give @s minecraft:enchanted_golden_apple 3
    
    # Apply special effects
    effect give @s minecraft:glowing 600 0 true
    effect give @s minecraft:regeneration 100 1 true
    effect give @s minecraft:fire_resistance 600 0 true
    
    # Fireworks!
    summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[255,16755200],FadeColors:[170,43690],Flicker:1,Trail:1}],Flight:1}}}}
}

# Give consolation prizes to survivors
execute as @a[tag=survivor] run {
    give @s minecraft:diamond 4
    give @s minecraft:cooked_beef 8
    effect give @s minecraft:regeneration 30 0
}

# Set game mode to spectator for everyone
gamemode spectator @a

# Reset world border
worldborder set 1000000 0

# Schedule game reset in 30 seconds
schedule function skinwalker:game/reset 30s

# Log the victory in console
tellraw @a[tag=op] ["",{"text":"[","color":"dark_gray"},{"text":"Skinwalker","color":"dark_red"},{"text":"] ","color":"dark_gray"},{"text":"Game ended - YouTuber victory!","color":"blue"}]
