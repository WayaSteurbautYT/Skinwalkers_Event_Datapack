# YouTuber gives the first task to players

# Different task based on YouTuber
execute as @s[scores={skinwalker.youtuber=1}] run tellraw @a ["",{"text":"[Dream]","color":"blue"},{"text":" Your first challenge is to gather resources. Collect 16 logs and 32 stone.","color":"white"}]

execute as @s[scores={skinwalker.youtuber=2}] run tellraw @a ["",{"text":"[MrBeast]","color":"blue"},{"text":" FIRST CHALLENGE: Gather 16 logs and 32 stone. First to complete gets a special prize!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=3}] run tellraw @a ["",{"text":"[Craftee]","color":"blue"},{"text":" Alright team, let's start with something simple. Gather 16 logs and 32 stone!","color":"white"}]

execute as @s[scores={skinwalker.youtuber=4}] run tellraw @a ["",{"text":"[Preston]","color":"blue"},{"text":" WOOO! First challenge! Collect 16 logs and 32 stone! LET'S GOOOO!","color":"white"}]

# Play sound effect
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

# Set up the first task for all players
scoreboard players set @a skinwalker.task1 0

# Give players their task tracker item
give @a[minecraft:compass] minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}',Lore:['{"text":"Current Task: Gather 16 logs and 32 stone","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Start checking for task completion
schedule function skinwalker:tasks/check_task1 5s replace
