# Update the current game phase and handle phase transitions

# Increment phase timer
scoreboard players add #phase_timer skinwalker.temp 1

# Check if we should advance to the next phase
scoreboard players operation #phase_duration skinwalker.temp = #phase1_duration skinwalker.temp
execute if score #phase skinwalker.phase matches 1 if score #phase_timer skinwalker.temp >= #phase_duration skinwalker.temp run function skinwalker:phase2/start

scoreboard players operation #phase_duration skinwalker.temp = #phase2_duration skinwalker.temp
execute if score #phase skinwalker.phase matches 2 if score #phase_timer skinwalker.temp >= #phase_duration skinwalker.temp run function skinwalker:phase3/start

scoreboard players operation #phase_duration skinwalker.temp = #phase3_duration skinwalker.temp
execute if score #phase skinwalker.phase matches 3 if score #phase_timer skinwalker.temp >= #phase_duration skinwalker.temp run {
    # Game over - no one won
    title @a title ["",{"text":"TIME'S UP!","color":"red","bold":true}]
    title @a subtitle ["",{"text":"No one completed their objectives in time!","color":"gray"}]
    
    # Stop the game
    scoreboard players set #phase skinwalker.phase 0
    playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
}

# Update phase-specific mechanics
execute if score #phase skinwalker.phase matches 1 run function skinwalker:phase1/update
execute if score #phase skinwalker.phase matches 2 run function skinwalker:phase2/update
execute if score #phase skinwalker.phase matches 3 run function skinwalker:phase3/update
