# Assign roles to players based on player count
# 1 player: YouTuber
# 2 players: 1 Survivor, 1 Skinwalker
# 3 players: 1 YouTuber, 1 Survivor, 1 Skinwalker
# 4+ players: 1 YouTuber, 1-2 Skinwalkers, rest Survivors

tellraw @a ["",{"text":"Assigning roles...","color":"yellow"}]

# Clear all roles first
execute as @a run {
    tag @s remove survivor
    tag @s remove skinwalker
    tag @s remove youtuber
    team leave @s
}

# Count players and store in score
# playerCount objective is now defined in setup_scoreboard.mcfunction
scoreboard players set #playerCount playerCount 0
execute as @a run scoreboard players add #playerCount playerCount 1

# Get player count for logic
scoreboard players get #playerCount playerCount

# Handle role assignment based on player count
execute if score #playerCount playerCount matches 1 run function skinwalker:roles/become_youtuber
# For solo, they become a YouTuber. The become_youtuber function handles tags, team, and abilities.

execute if score #playerCount playerCount matches 2 run {
    # 2 players: 1 Survivor, 1 Skinwalker
    execute as @a[sort=random,limit=1] run function skinwalker:roles/become_skinwalker
    execute as @a[tag=!skinwalker] run function skinwalker:roles/become_survivor
}

execute if score #playerCount playerCount matches 3 run {
    # 3 players: 1 YouTuber, 1 Survivor, 1 Skinwalker
    execute as @a[sort=random,limit=1] run function skinwalker:roles/become_youtuber
    execute as @a[tag=!youtuber,sort=random,limit=1] run function skinwalker:roles/become_skinwalker
    execute as @a[tag=!youtuber,tag=!skinwalker] run function skinwalker:roles/become_survivor
}

execute if score #playerCount playerCount matches 4.. run {
    # 4+ players: 1 YouTuber, 1-2 Skinwalkers, rest Survivors
    execute as @a[sort=random,limit=1] run function skinwalker:roles/become_youtuber
    
    # Assign 1-2 Skinwalkers based on player count
    execute as @a[tag=!youtuber,sort=random,limit=1] run function skinwalker:roles/become_skinwalker
    execute if score #playerCount playerCount matches 5.. as @a[tag=!youtuber,tag=!skinwalker,sort=random,limit=1] run function skinwalker:roles/become_skinwalker
    
    # Rest are Survivors
    execute as @a[tag=!youtuber,tag=!skinwalker] run function skinwalker:roles/become_survivor
}

# Assign tasks based on roles
execute as @a[tag=survivor] run function skinwalker:tasks/assign_tasks
execute as @a[tag=youtuber] run function skinwalker:assign_youtuber_tasks

# Set up teams
execute as @a[tag=survivor] run team join Survivor @s
execute as @a[tag=skinwalker] run team join Skinwalker @s
execute as @a[tag=youtuber] run team join YouTuber @s

# Set up team display names
team option Survivor color green
team option Survivor prefix "§8[§aSURVIVOR§8] §r"

team option Skinwalker color red
team option Skinwalker prefix "§8[§cSKINWALKER§8] §r"

team option YouTuber color blue
team option YouTuber prefix "§8[§9YOUTUBER§8] §r"

# Announce roles
tellraw @a ["\n",{"text":"=== ","color":"gold"},{"text":"ROLES ASSIGNED","color":"green","bold":true},{"text":" ===\n","color":"gold"}]
tellraw @a ["",{"text":"Check the sidebar for your role!","color":"gray"}]

# Play sound effect
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Give initial items and effects
function skinwalker:give_initial_items

tellraw @a[tag=skinwalker] ["",{"text":"You are a ","color":"gray"},{"text":"SKINWALKER","color":"red","bold":true},{"text":"! Blend in and eliminate all survivors.","color":"gray"}]
tellraw @a[tag=youtuber] ["",{"text":"You are a ","color":"gray"},{"text":"YOUTUBER","color":"blue","bold":true},{"text":"! Complete tasks and help survivors survive.","color":"gray"}]
tellraw @a[tag=survivor] ["",{"text":"You are a ","color":"gray"},{"text":"SURVIVOR","color":"green","bold":true},{"text":"! Complete tasks and survive the night.","color":"gray"}]
