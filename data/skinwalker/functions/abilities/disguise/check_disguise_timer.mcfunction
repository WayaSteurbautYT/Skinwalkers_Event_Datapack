# Check and manage active disguises
# Runs every second (20 ticks) if any player is disguised.

# Check if any player is disguised. If not, stop the loop.
execute unless entity @a[tag=disguised] run {
    data remove storage skinwalker:temp DisguiseCheckerRunning
    return 0
}

execute as @a[tag=disguised] run {
    # Disguises are disabled in phase 2 onwards (or specific later phases)
    # Example: Forcing removal if game phase is 2 or more. Adjust if needed.
    execute if score #phase skinwalker.phase matches 2.. run {
        tellraw @s {"text":"Your disguise flickers and fades in the intense atmosphere!","color":"light_purple"}
        function skinwalker:abilities/disguise/remove_disguise
        # 'remove_disguise' should handle all tags and cleanup.
        # Player will no longer be @a[tag=disguised] for the rest of this function's execution for them.
        return 0 # Stop processing this player if disguise removed
    }

    # Decrease the timer by 20 ticks (1 second)
    scoreboard players remove @s skinwalker.disguise_timer 20

    # Get remaining time in seconds for display
    scoreboard players operation #display_seconds skinwalker.temp = @s skinwalker.disguise_timer
    scoreboard players operation #display_seconds skinwalker.temp /= 20 # Assuming skinwalker.temp's "20" is just a const, not the global tick

    # Show action bar with remaining time (seconds only for simplicity, MM:SS was a bit much for 30s)
    execute if score @s skinwalker.disguise_timer matches 1.. run {
      title @s actionbar [
          "",
          {"text":"Disguise active: ","color":"dark_aqua"},
          {"score":{"name":"#display_seconds","objective":"skinwalker.temp"},"color":"aqua"},
          {"text":"s remaining","color":"dark_aqua"}
          // {"text":" (Right-click to cancel)","color":"gray","italic":true} // Optional: if cancel feature is added
      ]
    }
    
    # Check if timer has expired
    execute if score @s skinwalker.disguise_timer matches ..0 run {
        tellraw @s {"text":"Your disguise has worn off!","color":"red"}
        function skinwalker:abilities/disguise/remove_disguise
        return 0 # Stop processing this player
    }

    # Warning at 10 seconds remaining
    execute if score @s skinwalker.disguise_timer matches 200..200 run { # Exactly 10 seconds (200 ticks)
        title @s title ["",{"text":"DISGUISE FADING!","color":"gold"}]
        title @s subtitle ["",{"text":"10 seconds remaining...","color":"yellow"}]
        playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.2
    }

    # Countdown and visual effects for last 5 seconds
    execute if score @s skinwalker.disguise_timer matches 1..100 run { # 5 seconds = 100 ticks
        # Message for last 5 seconds (using #display_seconds)
        title @s actionbar ["",{"text":"Disguise unstable: ","color":"red"},{"score":{"name":"#display_seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":"s!","color":"red"}]
        playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.5
        particle minecraft:smoke ~ ~1 ~ 0.3 0.5 0.3 0.01 10
        # Random flash effect
        execute if score @s skinwalker.disguise_timer matches 20..20 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
        execute if score @s skinwalker.disguise_timer matches 40..40 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
        execute if score @s skinwalker.disguise_timer matches 60..60 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
        execute if score @s skinwalker.disguise_timer matches 80..80 run particle minecraft:flash ~ ~1 ~ 0 0 0 0 1
    }
}

# Reschedule this function to run again in 1 second
schedule function skinwalker:abilities/disguise/check_disguise_timer 1s replace
