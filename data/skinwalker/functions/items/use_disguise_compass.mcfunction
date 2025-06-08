# Handle right-click with Disguise Compass
# This is triggered when a player right-clicks with a compass that has the disguise tag

execute as @s[tag=Skinwalker] run {
    # Check cooldown
    execute unless score @s skinwalker.disguise_cooldown matches 1.. run function skinwalker:abilities/disguise/use
    
    # If on cooldown, show message
    execute if score @s skinwalker.disguise_cooldown matches 1.. run tellraw @s ["",{"text":"[ABILITY]","color":"dark_aqua"}," ",{"text":"Disguise is on cooldown for ","color":"red"},{"score":{"name":"@s","objective":"skinwalker.disguise_cooldown"},"color":"aqua"}," ",{"text":"seconds","color":"red"}]
}

# If not a Skinwalker, show error message
execute as @s[tag=!Skinwalker] run tellraw @s ["",{"text":"[ERROR]","color":"red"}," ",{"text":"Only Skinwalkers can use this item!","color":"white"}]
