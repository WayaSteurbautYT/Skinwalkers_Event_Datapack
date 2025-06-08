# End Game Function - Handles game conclusion and winner announcement

# Stop all sounds
stopsound @a *

# Determine winners
execute store result score #survivors skinwalker.temp run execute as @a[tag=survivor] run scoreboard players add #survivors skinwalker.temp 1
execute store result score #skinwalkers skinwalker.temp run execute as @a[tag=skinwalker] run scoreboard players add #skinwalkers skinwalker.temp 1

# Announce winners
execute if score #survivors skinwalker.temp > #skinwalkers skinwalker.temp run {
    # Survivors win
    title @a title ["",{"text":"SURVIVORS WIN!","color":"green","bold":true}]
    title @a subtitle ["",{"text":"The skinwalkers have been defeated!","color":"white"}]
    tellraw @a ["",{"text":"=== ","color":"green"},{"text":"SURVIVORS WIN!","bold":true},{"text":" ===\n","color":"green"},{"text":"The survivors have outlasted the skinwalkers!","color":"white"}]
    playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
}
execute if score #skinwalkers skinwalker.temp >= #survivors skinwalker.temp run {
    # Skinwalkers win
    title @a title ["",{"text":"SKINWALKERS WIN!","color":"red","bold":true}]
    title @a subtitle ["",{"text":"The survivors have been eliminated!","color":"white"}]
    tellraw @a ["",{"text":"=== ","color":"red"},{"text":"SKINWALKERS WIN!","bold":true},{"text":" ===\n","color":"red"},{"text":"The skinwalkers have taken over!","color":"white"}]
    playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1
}

# Reset game state after 10 seconds
schedule function skinwalker:reset_game 10s
