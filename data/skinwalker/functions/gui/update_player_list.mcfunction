# Update the player list in the sidebar
# This is called from update_sidebar.mcfunction

# Clear existing player entries
scoreboard players reset * skinwalker.sidebar

# Add survivors first
scoreboard players set #survivors_header skinwalker.sidebar 0

execute as @a[tag=survivor] run {
    # Add player with their task progress
    scoreboard players set @s skinwalker.sidebar 0
    
    # Add YouTuber indicator if applicable
    execute if entity @s[tag=youtuber] run {
        scoreboard players set @s skinwalker.sidebar 0
    }
}

# Add skinwalkers (only visible to other skinwalkers and OPs)
execute as @a[tag=skinwalker] run {
    scoreboard players set @s skinwalker.sidebar 0
    
    # Show disguised status
    execute if entity @s[tag=disguised] run {
        scoreboard players set @s skinwalker.sidebar 0
    }
}

# Add spectators
execute as @a[tag=spectator] run {
    scoreboard players set @s skinwalker.sidebar 0
}

# Update display names for all players
execute as @a run {
    # Default display name (player name)
    data modify entity @s CustomName set from entity @s CustomName
    
    # Add role indicators
    execute if entity @s[tag=survivor] run data modify entity @s CustomName set value '{"text":""}'
    execute if entity @s[tag=skinwalker] run data modify entity @s CustomName set value '{"text":""}'
    execute if entity @s[tag=spectator] run data modify entity @s CustomName set value '{"text":""}'
    
    # Add role-specific formatting
    execute if entity @s[tag=survivor] run data modify entity @s CustomName append value '{"text":"[S] ","color":"green"}'
    execute if entity @s[tag=skinwalker] run data modify entity @s CustomName append value '{"text":"[W] ","color":"red"}'
    execute if entity @s[tag=spectator] run data modify entity @s CustomName append value '{"text":"[SPECTATOR] ","color":"gray"}'
    
    # Add player name
    data modify entity @s CustomName append value '{"selector":"@s","color":"white"}'
    
    # Add YouTuber indicator
    execute if entity @s[tag=youtuber] run data modify entity @s CustomName append value '{"text":" ","color":"white"}'
    execute if entity @s[tag=youtuber] run data modify entity @s CustomName append value '{"text":"[YT]","color":"gold"}'
    
    # Add disguised indicator for skinwalkers
    execute if entity @s[tag=skinwalker,tag=disguised] run data modify entity @s CustomName append value '{"text":" ","color":"white"}'
    execute if entity @s[tag=skinwalker,tag=disguised] run data modify entity @s CustomName append value '{"text":"(Disguised)","color":"gray"}'
    
    # Add task progress for survivors
    execute if entity @s[tag=survivor] run {
        scoreboard players operation #completed skinwalker.temp = @s skinwalker.tasks_completed
        scoreboard players operation #total skinwalker.temp = @s skinwalker.tasks_total
        
        data modify entity @s CustomName append value '{"text":" ","color":"white"}'
        data modify entity @s CustomName append value '{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"}'
        data modify entity @s CustomName append value '{"text":"/","color":"gray"}'
        data modify entity @s CustomName append value '{"score":{"name":"#total","objective":"skinwalker.temp"},"color":"white"}'
    }
    
    # Update the scoreboard display name
    scoreboard players set @s skinwalker.sidebar 0
    scoreboard players set @s skinwalker.sidebar 0 {"text":""}
    data modify storage skinwalker:temp ScoreboardName set from entity @s CustomName
    scoreboard players set @s skinwalker.sidebar 0 {"storage":"skinwalker:temp","nbt":"ScoreboardName"}
}
