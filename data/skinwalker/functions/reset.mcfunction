# ============================================
# SKINWALKER EVENT - MASTER RESET FUNCTION
# ============================================
# This function completely resets the game state
# Use: /function skinwalker:reset

tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Resetting game... Please wait!","color":"white"}]

# Clear all entities except players and important game entities
kill @e[type=!player,type=!item,type=!experience_orb,type=!minecraft:item,type=!minecraft:experience_orb]

# Reset time and weather
time set day
weather clear

# Clear all teams
team empty Survivor
team empty Skinwalker
team empty YouTuber
team empty Spectator

# Reset all scoreboards
scoreboard objectives remove skinwalker.role
scoreboard objectives remove skinwalker.phase
scoreboard objectives remove skinwalker.timer
scoreboard objectives remove skinwalker.tasks
scoreboard objectives remove skinwalker.temp
scoreboard objectives remove skinwalker.cooldown

# Recreate essential scoreboards
scoreboard objectives add skinwalker.phase dummy
scoreboard objectives add skinwalker.role dummy
scoreboard players set #phase skinwalker.phase 0

# Reset all players
execute as @a run {
    # Clear tags
    tag @s remove survivor
    tag @s remove skinwalker
    tag @s remove youtuber
    tag @s remove disguised
    tag @s remove disguised_as
    tag @s remove spectator
    
    # Clear effects and inventory
    effect clear @s
    clear @s
    
    # Reset game mode and health
    gamemode adventure @s
    effect give @s minecraft:regeneration 3 1 true
    effect give @s minecraft:absorption 10 1 true
    
    # Reset spawn point
    spawnpoint @s 0 100 0
}

# Reset world border
worldborder set 60000000
worldborder damage amount 0.2
worldborder damage buffer 5

# Remove bossbar if it exists
execute run bossbar remove skinwalker:phase

# Teleport all players to spawn
tp @a 0 100 0

# Give basic starting items
give @a minecraft:stone_sword
give @a minecraft:bread 16

# Clear weather and time effects
weather clear 1000000

tellraw @a ["",{"text":"[","color":"dark_green"},{"text":"✓","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"Game has been reset!","color":"white"}]
tellraw @a ["",{"text":"[","color":"dark_green"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_green"},{"text":"Type ","color":"white"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":" to begin!","color":"white"}]

# Play sound effect
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Function stub for backward compatibility
function skinwalker:game/reset
