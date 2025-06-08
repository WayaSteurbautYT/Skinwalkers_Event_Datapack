# Check and manage active disguises
# Runs every second to handle disguise duration and cooldowns

execute as @a[tag=disguised] run {
    # Only process if in phase 1 (disguises disabled in phase 2)
    execute if score #game_phase skinwalker.phase matches 1 run {
        # Decrease the timer by 1 second (20 ticks)
        scoreboard players remove @s skinwalker.disguise_timer 20
        
        # Get remaining time in seconds
        scoreboard players operation #temp_sec skinwalker.temp = @s skinwalker.disguise_timer
        scoreboard players operation #temp_sec skinwalker.temp /= 20 const
        
        # Get remaining minutes and seconds
        scoreboard players operation #minutes skinwalker.temp = #temp_sec skinwalker.temp
        scoreboard players operation #minutes skinwalker.temp /= 60 const
        scoreboard players operation #seconds skinwalker.temp = #temp_sec skinwalker.temp
        scoreboard players operation #seconds skinwalker.temp %= 60 const
        
        # Show action bar with remaining time in MM:SS format
        execute if score #temp_sec skinwalker.temp matches 1.. run title @s actionbar [
            "",
            {"text":"Disguise: ","color":"dark_aqua"},
            {"score":{"name":"#minutes","objective":"skinwalker.temp"},"color":"aqua"},
            {"text":":","color":"dark_aqua"},
            {"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"aqua"},
            {"text":" ","color":"gray"},
            {"text":"(","color":"dark_gray"},
            {"text":"Right-click to cancel","color":"gray","italic":true},
            {"text":")","color":"dark_gray"}
        ]
        
        # Check if timer has expired
        execute if score @s skinwalker.disguise_timer matches ..0 run {
            # Notify the player
            title @s title ["",{"text":"DISGUISE EXPIRED!","color":"red","bold":true}]
            title @s subtitle ["",{"text":"Your true form is revealed!","color":"red"}]
            
            # Remove the disguise
            function skinwalker:abilities/disguise/remove_disguise
            
            # Don't process further for this player
            return 0
        }
        
        # Warning at 1 minute remaining (60 seconds)
        execute if score #temp_sec skinwalker.temp matches 60..60 run {
            title @s title ["",{"text":"1 MINUTE REMAINING","color":"gold"}]
            title @s subtitle ["",{"text":"Your disguise is wearing off...","color":"yellow"}]
            playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
        }
        
        # Warning at 30 seconds remaining
        execute if score #temp_sec skinwalker.temp matches 30..30 run {
            title @s title ["",{"text":"30 SECONDS REMAINING","color":"gold"}]
            title @s subtitle ["",{"text":"Your disguise is wearing thin!","color":"yellow"}]
            playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.2
        }
        
        # Warning at 10 seconds remaining (with countdown)
        execute if score #temp_sec skinwalker.temp matches 10..10 run {
            title @s title ["",{"text":"10 SECONDS REMAINING!","color":"red"}]
            title @s subtitle ["",{"text":"Your disguise is about to break!","color":"red"}]
            playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
        }
        
        # Countdown for last 5 seconds
        execute if score #temp_sec skinwalker.temp matches 1..5 run {
            title @s title ["",{"text":"§c"},{"score":{"name":"#temp_sec","objective":"skinwalker.temp"}}]
            playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1.5
        }
        
        # Visual effects when below 10 seconds
        execute if score #temp_sec skinwalker.temp matches 1..10 run {
            particle minecraft:smoke ~ ~1 ~ 0.5 1 0.5 0.1 5
            execute if score #tick skinwalker.temp matches 0..0 run {
                particle minecraft:flash ~ ~1 ~ 0.5 1 0.5 0.1 3
            }
        }
    }
    
    # If in phase 2, force remove disguise
    execute if score #game_phase skinwalker.phase matches 2.. unless entity @s[tag=disguised] run {
        function skinwalker:abilities/disguise/remove_disguise
    }
}

# Increment tick counter for timing
scoreboard players add #tick skinwalker.temp 1
scoreboard players set #tick skinwalker.temp 0 20

# Reschedule this function if there are still disguised players
execute if entity @a[tag=disguised] run schedule function skinwalker:abilities/disguise/check_disguise_timer 1s
