# Create a lightning storm event
# This strikes lightning in random locations to create tension

# Store the number of lightning strikes (3-5)
scoreboard players set #strikes skinwalker.temp 3
scoreboard players add #strikes skinwalker.temp 0..2

# Create lightning strikes in random locations
execute as @r[tag=survivor] at @s positioned ~ ~ ~ run {
    # First strike near a random player
    summon minecraft:lightning_bolt ~ ~ ~ {Tags:["event_lightning"]}
    playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1
    
    # Schedule additional strikes with delays
    execute if score #strikes skinwalker.temp matches 2.. run schedule function skinwalker:events/lightning_strike 20t
    execute if score #strikes skinwalker.temp matches 3.. run schedule function skinwalker:events/lightning_strike 40t
    execute if score #strikes skinwalker.temp matches 4.. run schedule function skinwalker:events/lightning_strike 60t
    
    # Notify players
    title @a title ["",{"text":"LIGHTNING STRIKE!","color":"yellow","bold":true}]
    tellraw @a ["",{"text":"[","color":"yellow"},{"text":"!","color":"yellow","bold":true},{"text":"] ","color":"yellow"},{"text":"A sudden storm rolls in...","color":"gray"}]
    
    # Change weather to thunder for dramatic effect
    weather thunder 600
}
