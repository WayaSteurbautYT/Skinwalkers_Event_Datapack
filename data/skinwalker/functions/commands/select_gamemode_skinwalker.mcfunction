# Function: skinwalker:commands/select_gamemode_skinwalker
# Purpose: Allows an operator to explicitly select the Skinwalker gamemode.

scoreboard players set #GAME_SETTINGS skinwalker.gamemode_selected 1
tellraw @s [{"text":"[Skinwalker Admin] ","color":"gold"},{"text":"Skinwalker gamemode (1) has been selected.","color":"green"}]
tellraw @s [{"text":"The next game started via ","color":"gray"},{"text":"/function skinwalker:start_event","color":"yellow"},{"text":" will be a Skinwalker game.","color":"gray"}]
