# Handle disguise selection from the GUI

# Check if player is currently selecting a disguise
execute unless entity @s[tag=selecting_disguise] run return 0

# Get the selected target
execute as @a[team=survivors,distance=..20,limit=1,sort=nearest] if score @s skinwalker.temp = #selected_index skinwalker.temp run {
    # Store target's UUID
    data modify storage skinwalker:temp TargetUUID set from entity @s UUID
    
    # Set cooldown (30 seconds)
    scoreboard players set @s skinwalker.ability_cooldown 600
    
    # Set duration (5 minutes)
    scoreboard players set @s skinwalker.ability_duration 6000
    
    # Add disguise tag
    tag @s add disguised
    
    # Store target's UUID in a tag for easy reference
    tag @s add disguised_as
    data modify entity @s Tags[-1] set from storage skinwalker:temp TargetUUID
    
    # Copy target's appearance
    function skinwalker:abilities/disguise/copy_identity
    
    # Notify player
    tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You have disguised as ","color":"red"},{"selector":"@p[tag=disguise_option_#selected_index,limit=1]","color":"yellow"}]
    
    # Play sound effect
    playsound minecraft:item.armor.equip_leather player @s ~ ~ ~ 1 1
    
    # Show particles
    particle minecraft:witch ~ ~1 ~ 0.5 1 0.5 0.1 20
    
    # Schedule disguise check
    schedule function skinwalker:abilities/disguise/check_disguise_timer 1s
}

# Clear selection tags
tag @s remove selecting_disguise
tag @s remove disguise_option_*
