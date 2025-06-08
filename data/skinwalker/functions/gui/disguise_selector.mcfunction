# Open a GUI for selecting a disguise

execute as @s[tag=skinwalker] run {
    # Store nearby players for disguise
    scoreboard players set #has_targets skinwalker.temp 0
    
    # Clear previous disguise options
    tag @s remove disguise_option
    
    # Add nearby survivors as options
    execute as @a[team=survivors,distance=..10,limit=5] run {
        scoreboard players add #has_targets skinwalker.temp 1
        
        # Store target's name in a tag
        data modify storage skinwalker:temp DisguiseTarget set from entity @s CustomName
        execute store result score #name_length skinwalker.temp run data get storage skinwalker:temp DisguiseTarget
        
        execute if score #name_length skinwalker.temp matches 1.. run {
            data modify storage skinwalker:temp DisguiseTarget set from storage skinwalker:temp DisguiseTarget
            data modify storage skinwalker:temp DisguiseTarget set string '{"text":"' run data get storage skinwalker:temp DisguiseTarget 1
            data modify storage skinwalker:temp DisguiseTarget set string '}' run math add 1 data get storage skinwalker:temp DisguiseTarget
            
            # Add as a disguise option
            tag @s add disguise_option
            data modify entity @s Tags[-1] set from storage skinwalker:temp DisguiseTarget
        }
    }
    
    # If no targets found, notify player
    execute if score #has_targets skinwalker.temp matches 0 run {
        tellraw @s ["",{"text":"[","color":"red"},{"text":"!","color":"dark_red","bold":true},{"text":"] ","color":"red"},{"text":"No survivors found nearby!","color":"white"}]
        playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
        return 0
    }
    
    # Open the disguise selection GUI
    tellraw @s ["",{"text":"=== ","color":"dark_red"},{"text":"SELECT DISGUISE","color":"red","bold":true},{"text":" ===","color":"dark_red"}]
    
    # List available disguises
    execute as @a[tag=disguise_option,limit=5] run {
        # Get the player's name from the tag
        data modify storage skinwalker:temp DisguiseTarget set from entity @s Tags[-1]
        
        # Send clickable message
        tellraw @s ["",{"text":"• ","color":"gray"},{"text":"Disguise as ","color":"white"},{"storage":"skinwalker:temp","nbt":"DisguiseTarget"},"\n",
        {"text":"  [Select]","color":"green","clickEvent":{"action":"run_command","value":"/trigger disguise_select set 1"},"hoverEvent":{"action":"show_text","contents":"Click to select this disguise"}}]
    }
    
    # Add cancel option
    tellraw @s ["\n",{"text":"[","color":"dark_gray"},{"text":"ESC","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"Cancel","color":"gray"}]
    
    # Play sound
    playsound minecraft:ui.button.click player @s ~ ~ ~ 1 1
}

# Clear temp storage
data remove storage skinwalker:temp DisguiseTarget
