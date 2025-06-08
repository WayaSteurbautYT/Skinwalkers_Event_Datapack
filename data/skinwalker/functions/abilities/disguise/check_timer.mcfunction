# Check if disguise duration has expired

execute as @a[tag=disguised] run {
    # Decrement timer
    scoreboard players remove @s skinwalker.ability_duration 1
    
    # Check if timer has expired
    execute if score @s skinwalker.ability_duration matches ..0 run {
        # Remove disguise
        function skinwalker:abilities/disguise/remove_disguise
        
        # Notify player
        title @s title ["",{"text":"DISGUISE EXPIRED","color":"red"}]
        title @s subtitle ["",{"text":"Your true form is revealed!","color":"dark_red"}]
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Your disguise has worn off!","color":"red"}]
        
        # Play sound effect
        playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
        
        # Alert nearby players
        execute at @s run tellraw @a[distance=..15] ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"selector":"@s"},{"text":"'s disguise has worn off!","color":"red"}]
    } else execute if score @s skinwalker.ability_duration matches 100|200|300|400|500|600 run {
        # Show time remaining warning
        execute store result score #minutes skinwalker.temp run scoreboard players get @s skinwalker.ability_duration
        scoreboard players operation #minutes skinwalker.temp /= 20 skinwalker.temp
        scoreboard players operation #minutes skinwalker.temp /= 60 skinwalker.temp
        
        execute if score #minutes skinwalker.temp matches 1 run tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red"},{"text":"] ","color":"dark_red"},{"text":"Your disguise will expire in ","color":"red"},{"score":{"name":"#minutes","objective":"skinwalker.temp"},"color":"white"},{"text":" minute!","color":"red"}]
        execute if score #minutes skinwalker.temp matches 2.. run tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red"},{"text":"] ","color":"dark_red"},{"text":"Your disguise will expire in ","color":"red"},{"score":{"name":"#minutes","objective":"skinwalker.temp"},"color":"white"},{"text":" minutes!","color":"red"}]
    }
}
