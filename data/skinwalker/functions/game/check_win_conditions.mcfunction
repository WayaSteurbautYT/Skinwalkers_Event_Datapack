# Check win/loss conditions for the Skinwalker game
# This runs every second from the main game loop

# Count players in each team
scoreboard players set #survivors_alive skinwalker.temp 0
scoreboard players set #skinwalkers_alive skinwalker.temp 0
scoreboard players set #youtubers_alive skinwalker.temp 0
scoreboard players set #youtubers_extracted skinwalker.temp 0

execute as @a[tag=survivor] run scoreboard players add #survivors_alive skinwalker.temp 1
execute as @a[tag=skinwalker] run scoreboard players add #skinwalkers_alive skinwalker.temp 1
execute as @a[tag=youtuber] run scoreboard players add #youtubers_alive skinwalker.temp 1
execute as @a[tag=winner] run scoreboard players add #youtubers_extracted skinwalker.temp 1

# Check for YouTuber extraction win (all YouTubers extracted)
execute if score #youtubers_extracted skinwalker.temp >= #youtubers_alive skinwalker.temp if score #youtubers_alive skinwalker.temp matches 1.. run {
    # YouTubers win by extraction
    title @a[tag=youtuber] title ["",{"text":"MISSION ACCOMPLISHED!","color":"aqua","bold":true}]
    title @a[tag=youtuber] subtitle ["",{"text":"You have successfully escaped!","color":"blue"}]
    
    title @a[tag=survivor] title ["",{"text":"MISSION COMPLETE","color":"green","bold":true}]
    title @a[tag=survivor] subtitle ["",{"text":"You helped the YouTubers escape!","color":"dark_green"}]
    
    title @a[tag=skinwalker] title ["",{"text":"MISSION FAILED","color":"red","bold":true}]
    title @a[tag=skinwalker] subtitle ["",{"text":"The YouTubers escaped!","color":"dark_red"}]
    
    # Play sounds
    playsound minecraft:ui.toast.challenge_complete master @a[tag=youtuber] ~ ~ ~ 1 1.5
    playsound minecraft:ui.toast.challenge_complete master @a[tag=survivor] ~ ~ ~ 1 1.2
    playsound minecraft:entity.ender_dragon.growl master @a[tag=skinwalker] ~ ~ ~ 1 0.8
    
    # End the game
    function skinwalker:game/end_youtubers_win
    return 0
}

# Check for Survivor/YouTuber win (no skinwalkers left)
execute unless score #skinwalkers_alive skinwalker.temp matches 1.. run {
    # Survivors and YouTubers win
    title @a[tag=survivor] title ["",{"text":"VICTORY!","color":"green","bold":true}]
    title @a[tag=survivor] subtitle ["",{"text":"All Skinwalkers have been eliminated!","color":"white"}]
    
    title @a[tag=youtuber] title ["",{"text":"VICTORY!","color":"blue","bold":true}]
    title @a[tag=youtuber] subtitle ["",{"text":"The Skinwalkers have been defeated!","color":"white"}]
    
    title @a[tag=skinwalker] title ["",{"text":"DEFEAT!","color":"red","bold":true}]
    title @a[tag=skinwalker] subtitle ["",{"text":"Your kind has been eradicated!","color":"dark_red"}]
    
    # Play victory sound for survivors/YouTubers and defeat sound for Skinwalkers
    playsound minecraft:ui.toast.challenge_complete master @a[tag=survivor] ~ ~ ~ 1 1.5
    playsound minecraft:ui.toast.challenge_complete master @a[tag=youtuber] ~ ~ ~ 1 1.5
    playsound minecraft:entity.wither.death master @a[tag=skinwalker] ~ ~ ~ 1 1
    
    # End the game
    function skinwalker:game/end_survivors_win
    return 0
}

# Check for Skinwalker win (no survivors/YouTubers left)
execute if score #skinwalkers_alive skinwalker.temp matches 1.. unless score #survivors_alive skinwalker.temp matches 1.. unless score #youtubers_alive skinwalker.temp matches 1.. run {
    # Skinwalkers win
    title @a[tag=skinwalker] title ["",{"text":"VICTORY!","color":"red","bold":true}]
    title @a[tag=skinwalker] subtitle ["",{"text":"All survivors have been eliminated!","color":"dark_red"}]
    
    title @a[tag=survivor] title ["",{"text":"DEFEAT!","color":"dark_red","bold":true}]
    title @a[tag=survivor] subtitle ["",{"text":"The Skinwalkers have taken over!","color":"red"}]
    
    title @a[tag=youtuber] title ["",{"text":"MISSION FAILED","color":"red","bold":true}]
    title @a[tag=youtuber] subtitle ["",{"text":"You were too late to escape!","color":"dark_red"}]
    
    # Play victory sound for Skinwalkers and defeat sound for others
    playsound minecraft:entity.ender_dragon.growl master @a[tag=skinwalker] ~ ~ ~ 1 1.5
    playsound minecraft:entity.wither.spawn master @a[tag=survivor,tag=!skinwalker] ~ ~ ~ 1 1
    playsound minecraft:entity.ender_dragon.growl master @a[tag=youtuber] ~ ~ ~ 1 1
    
    # End the game
    function skinwalker:game/end_skinwalkers_win
    return 0
}

# Check for draw (no players left)
execute unless score #survivors_alive skinwalker.temp matches 1.. unless score #skinwalkers_alive skinwalker.temp matches 1.. unless score #youtubers_alive skinwalker.temp matches 1.. run {
    title @a title ["",{"text":"DRAW!","color":"gold","bold":true}]
    title @a subtitle ["",{"text":"Everyone was eliminated!","color":"yellow"}]
    
    playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
    
    # End the game
    function skinwalker:game/end_draw
    return 0
}

# Check for YouTuber special win condition (all tasks completed)
# This applies if a YouTuber is in game AND the global task target is met.
# Particularly relevant for Solo mode, but could be a general win condition if YouTubers are primary taskers.
execute if score #youtubers_alive skinwalker.temp matches 1.. if score #tasks_completed_globally skinwalker.tasks_completed >= #total_tasks_needed skinwalker.tasks_total run {
    # YouTuber wins by completing all tasks (or being present when they are completed)
    # Ensure this doesn't prematurely end game if other win conditions (like survivor victory by elimination) are preferred.
    # This specific condition is good for a solo YouTuber.
    # For team games, might need to ensure other conditions (like survivors also alive) or make this a specific YouTuber escape.

    # For now, this will trigger a YouTuber win if they are present and tasks are done.
    # If it's solo mode (#playerCount == 1), this is the primary win condition.
    execute as @a[tag=youtuber] run {
        title @s title ["",{"text":"MISSION COMPLETE!","color":"gold","bold":true}]
        title @s subtitle ["",{"text":"You've completed all tasks!","color":"yellow"}]
    }
    
    title @a[tag=!youtuber] title ["",{"text":"YOUTUBER ESCAPED!","color":"blue","bold":true}]
    title @a[tag=!youtuber] subtitle ["",{"text":"The truth will be revealed...","color":"dark_blue"}]
    
    # Play special victory sound
    playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.5
    
    # End the game
    function skinwalker:game/end_youtuber_win
    return 0
}

# Check for sudden death draw (time runs out in phase 3 with both teams alive)
execute if score #phase skinwalker.phase matches 3 if score #phase_timer skinwalker.temp >= 2400 if entity @a[tag=skinwalker] if entity @a[tag=survivor] run {
    # Sudden death - both teams are eliminated
    title @a title ["",{"text":"SUDDEN DEATH!","color":"dark_red","bold":true}]
    title @a subtitle ["",{"text":"Time's up! No winners this round.","color":"red"}]
    
    # Play dramatic sound
    playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
    
    # End the game in a draw
    function skinwalker:game/end_draw
    return 0
}

# Check for game over (no players left)
execute unless entity @a[tag=!spectator] run {
    # No players left in the game
    tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Game over - no players remaining","color":"gray"}]
    
    # End the game
    function skinwalker:game/end
    return 0
}
