# Update action bar with relevant information for each player

execute as @a run {
    # Default action bar text
    data modify storage skinwalker:temp ActionBar set value '{"text":""}'
    
    # Add phase information
    execute if score #phase skinwalker.phase matches 1 run data modify storage skinwalker:temp ActionBar set value '{"text":"Phase 1: Survival | ","color":"green"}'
    execute if score #phase skinwalker.phase matches 2 run data modify storage skinwalker:temp ActionBar set value '{"text":"Phase 2: Showdown | ","color":"red"}'
    execute if score #phase skinwalker.phase matches 3 run data modify storage skinwalker:temp ActionBar set value '{"text":"Phase 3: Finale | ","color":"dark_red"}'
    
    # Add role-specific information
    execute if entity @s[tag=skinwalker] run {
        # For Skinwalkers: Show disguise cooldown
        execute if score @s skinwalker.ability_cooldown matches 1.. run {
            data modify storage skinwalker:temp ActionBar append value '{"text":"Disguise: ","color":"gray"}'
            data modify storage skinwalker:temp ActionBar append value '{"score":{"name":"@s","objective":"skinwalker.ability_cooldown"},"color":"red"}'
            data modify storage skinwalker:temp ActionBar append value '{"text":"s","color":"gray"}'
        }
        execute if score @s skinwalker.ability_cooldown matches ..0 if entity @s[tag=!disguised] run {
            data modify storage skinwalker:temp ActionBar append value '{"text":"Disguise Ready!","color":"green"}'
        }
        execute if entity @s[tag=disguised] run {
            data modify storage skinwalker:temp ActionBar append value '{"text":"Disguised as ","color":"gray"}'
            data modify storage skinwalker:temp ActionBar append value '{"nbt":"CustomName","entity":"@s","interpret":true,"color":"yellow"}'
            data modify storage skinwalker:temp ActionBar append value '{"text":" (","color":"gray"}'
            data modify storage skinwalker:temp ActionBar append value '{"score":{"name":"@s","objective":"skinwalker.ability_duration"},"color":"gold"}'
            data modify storage skinwalker:temp ActionBar append value '{"text":"s)","color":"gray"}'
        }
    }
    
    execute if entity @s[tag=survivor] run {
        # For Survivors: Show tasks completed
        scoreboard players operation #completed skinwalker.temp = @s skinwalker.tasks_completed
        scoreboard players operation #total skinwalker.temp = @s skinwalker.tasks_total
        
        data modify storage skinwalker:temp ActionBar append value '{"text":"Tasks: ","color":"gray"}'
        data modify storage skinwalker:temp ActionBar append value '{"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"}'
        data modify storage skinwalker:temp ActionBar append value '{"text":"/","color":"gray"}'
        data modify storage skinwalker:temp ActionBar append value '{"score":{"name":"#total","objective":"skinwalker.temp"},"color":"white"}'
    }
    
    # Add YouTuber specific info if applicable
    execute if entity @s[tag=youtuber] run {
        data modify storage skinwalker:temp ActionBar append value '{"text":" | ","color":"gray"}'
        data modify storage skinwalker:temp ActionBar append value '{"text":"YouTuber","color":"gold"}'
    }
    
    # Send the action bar
    title @s actionbar {"storage":"skinwalker:temp","nbt":"ActionBar"}
}
