# YouTuber gives the actual final task before Phase 2

execute as @a[tag=youtuber] run tellraw @a ["",{"text":"[YouTuber]","color":"blue"},{"text":" Okay, final challenge! Build a shelter before night falls. Things are about to get... interesting.","color":"white"}]

# Update task tracker
give @a[minecraft:compass] minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"red","italic":false}',Lore:['{"text":"Final Task: Build a shelter before night falls","color":"gray"}']},Enchantments:[{}],HideFlags:1} 1

# Start phase 2 after 2 minutes
schedule function skinwalker:phase2/start 2400t replace

# Warning message after 1 minute
schedule function skinwalker:youtuber/night_approaching 1200t replace
