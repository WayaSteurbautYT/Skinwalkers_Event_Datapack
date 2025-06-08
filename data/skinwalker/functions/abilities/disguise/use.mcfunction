# Use Disguise ability

# Set ability cooldown (e.g., 60 seconds)
scoreboard players set @s skinwalker.disguise_cooldown 1200

# Set disguise duration timer (e.g., 30 seconds)
scoreboard players set @s skinwalker.disguise_timer 600 # 30s * 20 ticks/s

# Tag player as disguised
tag @s add disguised

# Find nearest valid player to disguise as and store their info
data remove storage skinwalker:temp TargetToCopyUUID
data remove storage skinwalker:temp TargetToCopyName
# Make sure the target is not a spectator and is not the skinwalker themselves (though team check helps)
execute as @p[limit=1,sort=nearest,distance=..10,team=!Skinwalker,tag=!spectator] run {
    data modify storage skinwalker:temp TargetToCopyUUID set from entity @s UUID
    data modify storage skinwalker:temp TargetToCopyName set from entity @s CustomName
}

# If a target was found, proceed to copy identity. Otherwise, inform the Skinwalker.
execute if data storage skinwalker:temp TargetToCopyUUID run function skinwalker:abilities/disguise/copy_identity
execute unless data storage skinwalker:temp TargetToCopyUUID run {
    tellraw @s {"text":"No valid disguise target found nearby. Disguise failed.","color":"red"}
    # Untag 'disguised' and reset timer/cooldown as it failed.
    tag @s remove disguised
    scoreboard players set @s skinwalker.disguise_timer 0
    scoreboard players set @s skinwalker.disguise_cooldown 0 # Or a shorter fail cooldown e.g. 100 ticks (5s)
    return 0
}

# Visual effects for initiating disguise (assuming copy_identity will have its own success effects)
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
