# YouTuber introduction sequence
# This function handles the YouTuber's introduction and initial dialogue

execute as @a[tag=youtuber] at @s run function skinwalker:youtuber/intro_dialogue

# Schedule first task assignment
schedule function skinwalker:phase1/assign_initial_tasks 5s replace

# Play sound for all players
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Show message to all players
tellraw @a ["",{"text":"The YouTuber ","color":"gray"},{"text":"has arrived!","color":"blue","bold":true}]

# Make YouTuber say something
execute as @a[tag=youtuber] run function skinwalker:youtuber/say_intro

# Start phase timer (30 minutes until phase 2)
scoreboard players set #phase1_timer skinwalker.timer 36000  # 30 minutes in ticks

# Start phase 1 loop
schedule function skinwalker:phase1/loop 1s replace
