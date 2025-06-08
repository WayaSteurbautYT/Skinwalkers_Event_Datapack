# YouTuber introduction sequence
# This function handles the YouTuber's introduction and initial dialogue

execute as @a[tag=youtuber] at @s run function skinwalker:youtuber/intro_dialogue

# Schedule first task assignment (This seems redundant if tasks/setup_tasks is called by phase1/setup)
# Considering tasks/setup_tasks is more comprehensive, this specific assignment might be an older mechanic.
# For now, I will comment it out. If specific initial tasks for YouTubers are needed, this can be revisited.
# schedule function skinwalker:phase1/assign_initial_tasks 5s replace

# Play sound for all players
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.0

# Show message to all players
tellraw @a ["",{"text":"The YouTuber ","color":"gray"},{"text":"has arrived!","color":"blue","bold":true}]

# Make YouTuber say something (these are external functions, assumed to provide storyline)
execute as @a[tag=youtuber] run function skinwalker:youtuber/say_intro

# The main phase timer (#phase_timer skinwalker.temp) is managed by phase/update_phase and its duration (#phase1_duration) is set in phase1/setup.
# The call to the old phase1_loop is also removed.
