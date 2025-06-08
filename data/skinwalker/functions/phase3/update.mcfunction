# Phase 3: Finale - Per-tick updates

# Update bossbar with time remaining
scoreboard players operation #time_remaining skinwalker.temp = #phase3_duration skinwalker.temp
scoreboard players operation #time_remaining skinwalker.temp -= #phase_timer skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp = #time_remaining skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp /= 20 skinwalker.temp

# Update actionbar with time remaining
execute if score #time_remaining_seconds skinwalker.temp > 0 run title @a actionbar ["",{"text":"FINAL PHASE: ","color":"red"},{"text":"Showdown ","color":"white"},{"text":"• ","color":"gray"},{"text":"Time Left: ","color":"white"},{"score":{"name":"#time_remaining_seconds","objective":"skinwalker.temp"},"color":"red"},{"text":"s","color":"white"}]

# Play warning sound when 10 seconds remain
scoreboard players set #warning_time skinwalker.temp 200  # 10 seconds * 20 ticks
execute if score #time_remaining skinwalker.temp = #warning_time skinwalker.temp run {
    title @a title ["",{"text":"10 SECONDS REMAINING!","color":"red","bold":true}]
    playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2
}

# Check for player deaths and handle respawns
execute as @a[gamemode=spectator] at @s run function skinwalker:game/handle_respawn

# Check win conditions every tick (more frequent in final phase)
# Count remaining players
execute store result score #survivors_remaining skinwalker.temp run execute if entity @a[tag=survivor]
execute store result score #youtubers_remaining skinwalker.temp run execute if entity @a[tag=youtuber]
execute store result score #skinwalkers_remaining skinwalker.temp run execute if entity @a[tag=skinwalker]

# If no survivors or youtubers left, skinwalkers win
execute if score #survivors_remaining skinwalker.temp matches 0 if score #youtubers_remaining skinwalker.temp matches 0 run {
    title @a title ["",{"text":"SKINWALKERS WIN!","color":"red","bold":true}]
    title @a subtitle ["",{"text":"The hunt is over...","color":"gray"}]
    playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
    
    # End the game
    scoreboard players set #phase skinwalker.phase 0
    
    # Reset world border
    worldborder set 60000000
}

# If no skinwalkers left, survivors win
execute if score #skinwalkers_remaining skinwalker.temp matches 0 run {
    title @a[tag=!skinwalker] title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
    title @a[tag=!skinwalker] subtitle ["",{"text":"The threat has been eliminated!","color":"white"}]
    title @a[tag=skinwalker] title ["",{"text":"DEFEAT!","color":"red","bold":true}]
    playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
    
    # End the game
    scoreboard players set #phase skinwalker.phase 0
    
    # Reset world border
    worldborder set 60000000
}

# If time runs out, check who has more players remaining
scoreboard players set #survivor_team_count skinwalker.temp 0
scoreboard players set #skinwalker_team_count skinwalker.temp 0

execute if score #time_remaining_seconds skinwalker.temp matches ..0 run {
    # Count team members
    execute as @a[tag=survivor] run scoreboard players add #survivor_team_count skinwalker.temp 1
    execute as @a[tag=youtuber] run scoreboard players add #survivor_team_count skinwalker.temp 1
    execute as @a[tag=skinwalker] run scoreboard players add #skinwalker_team_count skinwalker.temp 1
    
    # Determine winner
    execute if score #survivor_team_count skinwalker.temp > #skinwalker_team_count skinwalker.temp run {
        title @a title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
        title @a subtitle ["",{"text":"Time's up - more survivors remain!","color":"white"}]
        playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
    }
    
    execute if score #skinwalker_team_count skinwalker.temp > #survivor_team_count skinwalker.temp run {
        title @a title ["",{"text":"SKINWALKERS WIN!","color":"red","bold":true}]
        title @a subtitle ["",{"text":"Time's up - the hunt was successful!","color":"white"}]
        playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
    }
    
    # In case of a tie
    execute if score #survivor_team_count skinwalker.temp = #skinwalker_team_count skinwalker.temp run {
        title @a title ["",{"text":"DRAW!","color":"gold","bold":true}]
        title @a subtitle ["",{"text":"The battle ends in a stalemate!","color":"white"}]
        playsound minecraft:block.note_block.didgeridoo master @a ~ ~ ~ 1 1
    }
    
    # End the game
    scoreboard players set #phase skinwalker.phase 0
    
    # Reset world border
    worldborder set 60000000
}
