# Reduce cooldown for all players
execute as @a[scores={skinwalker.cooldown=1..}] run scoreboard players remove @s skinwalker.cooldown 1

# Reschedule if any players still have cooldown
execute if entity @a[scores={skinwalker.cooldown=1..}] run schedule function skinwalker:commands/start_cooldown 1s replace
