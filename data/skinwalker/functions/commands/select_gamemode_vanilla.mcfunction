# Function: skinwalker:commands/select_gamemode_vanilla
# Purpose: Allows an operator to select a Vanilla-Plus mode (disabling Skinwalker game mechanics).

scoreboard players set #GAME_SETTINGS skinwalker.gamemode_selected 0
tellraw @s [{"text":"[Skinwalker Admin] ","color":"gold"},{"text":"Vanilla-Plus gamemode (0) has been selected.","color":"yellow"}]
tellraw @s [{"text":"Skinwalker-specific game mechanics will be disabled for the next game started via ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":".","color":"gray"}]
