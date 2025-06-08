# Phase 2: Hunt - Per-tick updates

# Update bossbar with time remaining
scoreboard players operation #time_remaining skinwalker.temp = #phase2_duration skinwalker.temp
scoreboard players operation #time_remaining skinwalker.temp -= #phase_timer skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp = #time_remaining skinwalker.temp
scoreboard players operation #time_remaining_seconds skinwalker.temp /= 20 skinwalker.temp

# Update actionbar with time remaining
execute if score #time_remaining_seconds skinwalker.temp > 0 run title @a actionbar ["",{"text":"Phase 2: ","color":"yellow"},{"text":"Hunt ","color":"white"},{"text":"• ","color":"gray"},{"text":"Time Left: ","color":"white"},{"score":{"name":"#time_remaining_seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":"s","color":"white"}]

# Play warning sound when 30 seconds remain
scoreboard players set #warning_time skinwalker.temp 600  # 30 seconds * 20 ticks
execute if score #time_remaining skinwalker.temp = #warning_time skinwalker.temp run {
    title @a title ["",{"text":"30 SECONDS REMAINING!","color":"red","bold":true}]
    playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.5
}

# Check for player deaths and handle respawns
execute as @a[gamemode=spectator] at @s run function skinwalker:game/handle_respawn

# Check win conditions every second (20 ticks)
scoreboard players add #win_check_timer skinwalker.temp 1
scoreboard players set #win_check_delay skinwalker.temp 20
execute if score #win_check_timer skinwalker.temp >= #win_check_delay skinwalker.temp run {
    scoreboard players set #win_check_timer skinwalker.temp 0
    
    # Count remaining players
    execute store result score #survivors_remaining skinwalker.temp run execute if entity @a[tag=survivor]
    execute store result score #youtubers_remaining skinwalker.temp run execute if entity @a[tag=youtuber]
    execute store result score #skinwalkers_remaining skinwalker.temp run execute if entity @a[tag=skinwalker]
    
    # If no survivors or youtubers left, skinwalkers win
    execute if score #survivors_remaining skinwalker.temp matches 0 if score #youtubers_remaining skinwalker.temp matches 0 run {
        title @a title ["",{"text":"SKINWALKERS WIN!","color":"red","bold":true}]
        playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
        
        # End the game
        scoreboard players set #phase skinwalker.phase 0
    }
    
    # If no skinwalkers left, survivors win
    execute if score #skinwalkers_remaining skinwalker.temp matches 0 run {
        title @a[tag=!skinwalker] title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
        title @a[tag=skinwalker] title ["",{"text":"DEFEAT!","color":"red","bold":true}]
        playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
        
        # End the game
        scoreboard players set #phase skinwalker.phase 0
    }
}
