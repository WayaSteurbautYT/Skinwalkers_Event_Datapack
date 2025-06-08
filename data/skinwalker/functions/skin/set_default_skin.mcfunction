# Reset player's skin to their default
# This uses Identity mod's skin reset

# Store player's name for comparison
scoreboard players set #player_name skinwalker.temp 0

execute store result score #player_name skinwalker.temp run data get entity @s CustomName 1

# Check for specific players and set their default skins
execute if score #player_name skinwalker.temp matches 1 if entity @s[name="WayaSteurbautYTR"] run skin set @s name WayaSteurbautYTR
execute if score #player_name skinwalker.temp matches 2 if entity @s[name="Udnof007"] run skin set @s name Udnof007
execute if score #player_name skinwalker.temp matches 3 if entity @s[name="Babi"] run skin player @s set https://files.catbox.moe/ur57tg.png
execute if score #player_name skinwalker.temp matches 4 if entity @s[name="Dream"] run skin set @s name Dream
execute if score #player_name skinwalker.temp matches 5 if entity @s[name="Craftee"] run skin set @s name Parker_Games
execute if score #player_name skinwalker.temp matches 6 if entity @s[name="MrBeast"] run identity equip @s minecraft:enderman

# For all other players, set to default Steve skin
execute unless score #player_name skinwalker.temp matches 1..6 run skin set @s name Steve

# If using Identity mod, you might need to use:
# execute as @s run identity set-skin @s player @s

# For a more reliable approach with Identity mod, you could store their original skin on join
# and restore it here using the stored skin data
