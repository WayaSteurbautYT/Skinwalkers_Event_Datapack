# Handle phased state for skinwalkers

execute as @a[tag=phased] run {
    # Decrement duration
    scoreboard players remove @s skinwalker.ability_duration 1
    
    # Check if duration has expired
    execute if score @s skinwalker.ability_duration matches ..0 run {
        # Remove phased tag
        tag @s remove phased
        
        # Clear effects
        effect clear @s minecraft:resistance
        effect clear @s minecraft:invisibility
        
        # Visual effects
        particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 20
        playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
        
        # Notify player
        title @s actionbar ["",{"text":"[","color":"dark_purple"},{"text":"!","color":"dark_purple"},{"text":"] ","color":"dark_purple"},{"text":"Phase Shift ","color":"dark_purple"},{"text":"ended!","color":"white"}]
    } else {
        # Extend effects
        effect give @s minecraft:resistance 3 255 true
        effect give @s minecraft:invisibility 3 0 true
        
        # Show time remaining in action bar every second
        execute if score @s skinwalker.ability_duration matches 20|40|60|80|100 run {
            scoreboard players operation #seconds skinwalker.temp = @s skinwalker.ability_duration
            scoreboard players operation #seconds skinwalker.temp /= 20 skinwalker.temp
            
            title @s actionbar ["",{"text":"Phase Shift: ","color":"dark_purple"},{"score":{"name":"#seconds","objective":"skinwalker.temp"},"color":"white"},{"text":"s remaining","color":"gray"}]
        }
    }
}
