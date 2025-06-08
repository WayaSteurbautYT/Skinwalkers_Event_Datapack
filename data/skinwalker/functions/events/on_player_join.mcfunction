# Handle player join

execute as @a[tag=!joined] run {
    # Mark as joined
    tag @s add joined
    
    # Clear any existing tags
    tag @s remove skinwalker
    tag @s remove survivor
    tag @s remove disguised
    tag @s remove has_night_vision
    tag @s remove phased
    
    # Reset scores
    scoreboard players set @s skinwalker.ability_cooldown 0
    scoreboard players set @s skinwalker.ability_duration 0
    scoreboard players set @s skinwalker.task_mine_ores 0
    scoreboard players set @s skinwalker.task_craft_items 0
    scoreboard players set @s skinwalker.task_kill_mobs 0
    scoreboard players set @s skinwalker.task_travel_distance 0
    scoreboard players set @s skinwalker.task_build_structure 0
    
    # Clear inventory and effects
    clear @s
    effect clear @s
    
    # Set game mode based on game state
    execute if score #game_phase skinwalker.phase matches 0 run {
        # Game hasn't started, set to spectator
        gamemode spectator @s
        
        # Welcome message
        title @s title ["",{"text":"Welcome to Skinwalker!","color":"gold","bold":true}]
        title @s subtitle ["",{"text":"Waiting for the game to start...","color":"gray"}]
    } else {
        # Game in progress, add to spectators team
        team join spectators @s
        gamemode spectator @s
        
        # Notify they're spectating
        title @s title ["",{"text":"SPECTATOR MODE","color":"gray","bold":true}]
        title @s subtitle ["",{"text":"You joined mid-game","color":"white"}]
    }
    
    # Give them the rules
    tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Welcome to ","color":"white"},{"text":"Skinwalker","color":"gold","bold":true},"\n",
    {"text":"Survivors ","color":"green"},{"text":"must complete tasks while identifying the ","color":"white"},{"text":"Skinwalkers","color":"red"},"\n",
    {"text":"Skinwalkers ","color":"red"},{"text":"must eliminate all ","color":"white"},{"text":"Survivors","color":"green"},{"text":" without being caught!","color":"white"}]
    
    # If game is in progress, show current status
    execute if score #game_phase skinwalker.phase matches 1.. run {
        tellraw @s ["\n",{"text":"[","color":"dark_gray"},{"text":"i","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"Game is currently in ","color":"white"},{"text":"Phase ","color":"yellow"},{"score":{"name":"#game_phase","objective":"skinwalker.phase"},"color":"yellow"}]
        
        # Show team info
        execute if entity @s[team=spectators] run 
            tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"i","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"You are a ","color":"white"},{"text":"Spectator","color":"gray"}]
        
        # If in phase 1, show task progress
        execute if score #game_phase skinwalker.phase matches 1 run {
            scoreboard players set #completed skinwalker.temp 0
            scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
            scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
            scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
            scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
            scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure
            
            tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"i","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"Your progress: ","color":"white"},{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"yellow"},{"text":"/5 tasks completed","color":"white"}]
        }
    }
}
