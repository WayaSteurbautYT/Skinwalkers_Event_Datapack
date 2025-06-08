# YouTuber gives the second task to players

# Different task based on YouTuber
execute as @a[tag=youtuber] run tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" Great job everyone! For your next challenge, craft a full set of iron armor and tools!","color":"white"}]

# Play sound effect
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

# Set up the second task for all players
scoreboard players set @a skinwalker.task2 0

# Update task tracker item
give @a[minecraft:compass] minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"yellow","italic":false}',Lore:['{"text":"Current Task: Craft iron armor and tools","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Start checking for task completion
schedule function skinwalker:tasks/check_task2 5s replace
