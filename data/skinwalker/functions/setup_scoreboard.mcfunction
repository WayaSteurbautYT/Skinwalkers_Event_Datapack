# Setup scoreboard objectives

# Remove existing objectives if they exist
scoreboard objectives remove skinwalker.role
scoreboard objectives remove skinwalker.phase
scoreboard objectives remove skinwalker.tasks
scoreboard objectives remove skinwalker.cooldown
scoreboard objectives remove skinwalker.ability_cooldown
scoreboard objectives remove skinwalker.ability_duration
scoreboard objectives remove skinwalker.temp
scoreboard objectives remove skinwalker.sidebar

# Create objectives
scoreboard objectives add skinwalker.role dummy "Role"
scoreboard objectives add skinwalker.phase dummy "Game Phase"
scoreboard objectives add skinwalker.tasks dummy "Tasks Completed"
scoreboard objectives add skinwalker.cooldown dummy "Cooldown"
scoreboard objectives add skinwalker.ability_cooldown dummy "Ability Cooldown"
scoreboard objectives add skinwalker.ability_duration dummy "Ability Duration"
scoreboard objectives add skinwalker.temp dummy "Temp"

# Create sidebar display
scoreboard objectives add skinwalker.sidebar dummy "Skinwalker"

# Set display names
scoreboard objectives modify skinwalker.role displayname "Role"
scoreboard objectives modify skinwalker.phase displayname "Game Phase"
scoreboard objectives modify skinwalker.tasks displayname "Tasks"
scoreboard objectives modify skinwalker.cooldown displayname "Cooldown"
scoreboard objectives modify skinwalker.ability_cooldown displayname "Ability CD"
scoreboard objectives modify skinwalker.ability_duration displayname "Ability"
scoreboard objectives modify skinwalker.sidebar displayname "§6§lSkinwalker"

# Initialize global variables
scoreboard players set #game_phase skinwalker.phase 0
scoreboard players set #phase_timer skinwalker.temp 0
scoreboard players set #task_check_timer skinwalker.temp 0
scoreboard players set #phase_transition_timer skinwalker.temp 0
scoreboard players set #survivors_alive skinwalker.temp 0
scoreboard players set #skinwalkers_alive skinwalker.temp 0
scoreboard players set #join_timer skinwalker.temp 0
scoreboard players set #scoreboard_timer skinwalker.temp 0

# Set sidebar display
scoreboard objectives setdisplay sidebar skinwalker.sidebar
