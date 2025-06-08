# Toggle night vision for skinwalkers

# Check if night vision is active
execute if entity @s[tag=has_night_vision] run {
    # Remove night vision
    effect clear @s minecraft:night_vision
    tag @s remove has_night_vision
    
    # Notify player
    title @s actionbar ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red"},{"text":"] ","color":"dark_red"},{"text":"Night Vision ","color":"red"},{"text":"Disabled","color":"gray"}]
    playsound minecraft:block.redstone_torch.burnout player @s ~ ~ ~ 1 1.5
} else {
    # Add night vision
    effect give @s minecraft:night_vision 1000000 0 true
    tag @s add has_night_vision
    
    # Notify player
    title @s actionbar ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red"},{"text":"] ","color":"dark_red"},{"text":"Night Vision ","color":"red"},{"text":"Enabled","color":"green"}]
    playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 1.5
}
