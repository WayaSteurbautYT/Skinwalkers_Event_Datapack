# Update the scoreboard for all players with current game information

# Set up the scoreboard display
scoreboard objectives setdisplay sidebar skinwalker.role

# Update player roles and information
execute as @a run {
    # Clear previous scoreboard
    scoreboard players reset * skinwalker.role
    
    # Set player's role display
    execute if entity @s[tag=survivor] run scoreboard players set @s skinwalker.role 1
    execute if entity @s[tag=skinwalker] run scoreboard players set @s skinwalker.role 2
    execute if entity @s[tag=youtuber] run scoreboard players set @s skinwalker.role 3
    
    # Get current phase
    execute store result score #current_phase skinwalker.role run scoreboard players get #phase skinwalker.phase
    
    # Set display name based on role
    execute if entity @s[tag=survivor] run scoreboard players set @s skinwalker.role 1 {TeamColor:"green",DisplayName:"Survivor"}
    execute if entity @s[tag=skinwalker] run scoreboard players set @s skinwalker.role 2 {TeamColor:"red",DisplayName:"Skinwalker"}
    execute if entity @s[tag=youtuber] run scoreboard players set @s skinwalker.role 3 {TeamColor:"blue",DisplayName:"YouTuber"}
    
    # Update player list header/footer
    execute if score #current_phase skinwalker.role matches 0 run {
        title @s actionbar ["",{"text":"Waiting for game to start...","color":"gray"}]
    }
    execute if score #current_phase skinwalker.role matches 1.. run {
        title @s actionbar ["",{"text":"Phase ","color":"gold"},{"score":{"name":"#current_phase","objective":"skinwalker.role"},"color":"yellow"},{"text":" • ","color":"gray"},{"text":"Tasks: ","color":"white"},{"score":{"name":"#tasks_completed","objective":"skinwalker.tasks_completed"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#total_tasks","objective":"skinwalker.tasks_total"},"color":"green"}]
    }
}

# Update team colors in tab list
execute as @a[tag=survivor] run team option Survivor color green
execute as @a[tag=skinwalker] run team option Skinwalker color red
execute as @a[tag=youtuber] run team option YouTuber color blue

# Update bossbar based on phase
execute if score #phase skinwalker.phase matches 1 run bossbar set skinwalker:phase name ["",{"text":"Phase 1: ","color":"green"},{"text":"Survival"}]
execute if score #phase skinwalker.phase matches 2 run bossbar set skinwalker:phase name ["",{"text":"Phase 2: ","color":"yellow"},{"text":"Hunt"}]
execute if score #phase skinwalker.phase matches 3 run bossbar set skinwalker:phase name ["",{"text":"Phase 3: ","color":"red"},{"text":"Finale"}]

# Update bossbar progress
execute store result score #phase_progress skinwalker.role run scoreboard players get #phase_timer skinwalker.temp
execute store result score #phase_max skinwalker.role run scoreboard players get #phase_duration skinwalker.temp
scoreboard players operation #bossbar_value skinwalker.role = #phase_progress skinwalker.role
scoreboard players operation #bossbar_max skinwalker.role = #phase_max skinwalker.role
scoreboard players operation #bossbar_value skinwalker.role *= 100 skinwalker.role
scoreboard players operation #bossbar_value skinwalker.role /= #bossbar_max skinwalker.role

# Ensure the value is between 0 and 100
scoreboard players set #min_value skinwalker.role 0
scoreboard players set #max_value skinwalker.role 100
scoreboard players operation #bossbar_value skinwalker.role > #min_value skinwalker.role
scoreboard players operation #bossbar_value skinwalker.role < #max_value skinwalker.role

# Update the bossbar value
bossbar set skinwalker:value #bossbar_value skinwalker.role

# Show bossbar to all players
bossbar set skinwalker:phase players @a
