# Handle player respawn

execute as @a[gamemode=!spectator] run {
    # If game is in progress
    execute if score #game_phase skinwalker.phase matches 1.. run {
        # If they're a survivor, give them survival items
        execute if entity @s[tag=survivor] run {
            # Give basic survival items
            give @s minecraft:stone_sword
            give @s minecraft:bread 8
            
            # If in phase 2, give better gear
            execute if score #game_phase skinwalker.phase matches 2.. run {
                give @s minecraft:iron_sword
                give @s minecraft:shield
                give @s minecraft:iron_helmet
                give @s minecraft:iron_chestplate
                give @s minecraft:iron_leggings
                give @s minecraft:iron_boots
                give @s minecraft:cooked_beef 8
            }
        }
        
        # If they're a skinwalker, give them their abilities
        execute if entity @s[tag=skinwalker] run {
            # Give skinwalker abilities
            function skinwalker:give_skinwalker_abilities
            
            # Check if they were disguised before death
            execute if data entity @s DisguiseTarget run {
                # Get the target's UUID
                data modify storage skinwalker:temp TargetUUID set from entity @s DisguiseTarget
                data modify storage skinwalker:temp TargetName set from entity @s DisguiseName
                
                # Reapply the disguise
                function skinwalker:abilities/disguise/copy_identity
                
                # Notify the player
                tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"Your disguise has been restored!","color":"red"}]
                
                # Re-add the disguised tag
                tag @s add disguised
                
                # Schedule the disguise timer check
                schedule function skinwalker:abilities/disguise/check_disguise_timer 1s
            }
            
            # If in phase 2, give combat gear
            execute if score #game_phase skinwalker.phase matches 2.. run {
                give @s minecraft:iron_sword{Enchantments:[{id:sharpness,lvl:2},{id:knockback,lvl:1}]}
                give @s minecraft:iron_helmet{Enchantments:[{id:protection,lvl:2}]}
                give @s minecraft:iron_chestplate{Enchantments:[{id:protection,lvl:2}]}
                give @s minecraft:iron_leggings{Enchantments:[{id:protection,lvl:2}]}
                give @s minecraft:iron_boots{Enchantments:[{id:protection,lvl:2},{id:feather_falling,lvl:2}]}
                
                # Apply effects
                effect give @s minecraft:strength 1000000 0 true
                effect give @s minecraft:speed 1000000 1 true
            }
        }
    } else {
        # Game not in progress, set to spectator
        gamemode spectator @s
        tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"i","color":"gray"},{"text":"] ","color":"dark_gray"},{"text":"Waiting for the game to start...","color":"white"}]
    }
}
