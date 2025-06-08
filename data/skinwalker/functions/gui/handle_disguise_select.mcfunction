# Handle disguise selection from the GUI

execute as @a[scores={disguise_select=1..}] run {
    # Reset the trigger
    scoreboard players set @s disguise_select 0
    
    # Find the selected player
    execute as @a[tag=disguise_option,limit=1,sort=nearest] run {
        # Copy the target's identity
        function skinwalker:abilities/disguise/copy_identity
        
        # Set cooldown (30 seconds)
        scoreboard players set @s skinwalker.ability_cooldown 600
        
        # Set duration (5 minutes)
        scoreboard players set @s skinwalker.ability_duration 6000
        
        # Add disguise tag
        tag @s add disguised
        
        # Store target's name in a tag for easy reference
        data modify storage skinwalker:temp DisguiseTarget set from entity @s Tags[-1]
        
        # Notify player
        tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You have disguised as ","color":"red"},{"storage":"skinwalker:temp","nbt":"DisguiseTarget"}]
        
        # Play sound effect
        playsound minecraft:item.armor.equip_leather player @s ~ ~ ~ 1 1
    }
    
    # Clear the disguise option tags
    tag @s remove disguise_option
}

# Clear temp storage
data remove storage skinwalker:temp DisguiseTarget
