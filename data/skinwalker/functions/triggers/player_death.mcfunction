# Triggered when a player dies

# Handle player death
function skinwalker:on_player_death

# Check win condition for Skinwalkers
scoreboard players set #survivors skinwalker.role 0
execute store result score #survivors skinwalker.role if entity @a[team=Survivor]

execute if score #survivors skinwalker.role <= 0 run function skinwalker:skinwalkers_win
