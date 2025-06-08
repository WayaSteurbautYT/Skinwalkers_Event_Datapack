# Handle /disguise info command

# Check if player is disguised
execute if entity @s[tag=disguised] run {
    # Get remaining duration in seconds
    scoreboard players operation #seconds_remaining skinwalker.temp = @s skinwalker.ability_duration
    scoreboard players operation #seconds_remaining skinwalker.temp /= 20 const
    scoreboard players add #seconds_remaining skinwalker.temp 1
    
    # Get disguised as name
    data modify storage skinwalker:temp DisguiseName set from entity @s DisguiseName
    
    # Show disguise info
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are currently disguised as ","color":"red"},{"storage":"skinwalker:temp","nbt":"DisguiseName","interpret":true}]
    tellraw @s ["  ",{"text":"Time remaining: ","color":"gray"},{"score":{"name":"#seconds_remaining","objective":"skinwalker.temp"},"color":"yellow"},{"text":" seconds","color":"gray"}]
    tellraw @s ["  ",{"text":"Use ","color":"gray"},{"text":"/disguise remove","color":"yellow"},{"text":" to remove your disguise","color":"gray"}]
} else {
    # Check cooldown
    execute if score @s skinwalker.ability_cooldown matches 1.. run {
        # Calculate remaining seconds
        scoreboard players operation #seconds skinwalker.temp = @s skinwalker.ability_cooldown
        scoreboard players operation #seconds skinwalker.temp /= 20 const
        scoreboard players add #seconds skinwalker.temp 1
        
        # Show cooldown info
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are not currently disguised.","color":"red"}]
        tellraw @s ["  ",{"text":"Disguise cooldown: ","color":"gray"},{"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":" seconds remaining","color":"gray"}]
    } else {
        # Not disguised and no cooldown
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are not currently disguised.","color":"red"}]
        tellraw @s ["  ",{"text":"Use ","color":"gray"},{"text":"/disguise select","color":"yellow"},{"text":" to choose a disguise","color":"gray"}]
    }
}
