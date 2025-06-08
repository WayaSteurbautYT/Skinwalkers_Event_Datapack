# Use Disguise ability

# Set ability cooldown (e.g., 60 seconds)
scoreboard players set @s skinwalker.disguise_cooldown 1200

# Set disguise duration timer (e.g., 30 seconds)
scoreboard players set @s skinwalker.disguise_timer 600 # 30s * 20 ticks/s

# Tag player as disguised (copy_identity should also add a specific disguised_as_PLAYERNAME tag)
tag @s add disguised

# Find nearest player to disguise as and apply the disguise
# Assuming skinwalker:abilities/disguise/copy_identity handles the actual appearance change
# and sets a specific tag like "disguised_as_Notch" or similar for identification.
execute as @p[limit=1,sort=nearest,distance=..10,team=!Skinwalker] at @s run function skinwalker:abilities/disguise/copy_identity

# Visual effects for initiating disguise
playsound minecraft:entity.illusioner.prepare_mirror master @s ~ ~ ~ 1 1.2
particle minecraft:effect ~ ~1 ~ 0.5 0.5 0.5 0.1 50

tellraw @s ["",{"text":"[ABILITY] ","color":"dark_aqua"},{"text":"You attempt to blend in...","color":"aqua"}]

# Schedule the checker function if it's not already running for someone.
# The checker itself will reschedule as long as someone is disguised.
# This is a failsafe; ideally, game_tick would start it if any player has skinwalker.disguise_timer > 0
execute unless data storage skinwalker:temp {DisguiseCheckerRunning:1b} run {
    function skinwalker:abilities/disguise/check_disguise_timer
    data modify storage skinwalker:temp DisguiseCheckerRunning set value 1b
}
# The old scheduled remove_disguise is removed, check_disguise_timer will handle it.
