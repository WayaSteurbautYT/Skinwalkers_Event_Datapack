# Handle player death

execute as @a[scores={deathCount=1..}] at @s run function skinwalker:convert_to_spectator
scoreboard players set @a deathCount 0
