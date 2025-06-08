# End the game and clean up

# Stop all scheduled functions
schedule clear skinwalker:phase1/loop
schedule clear skinwalker:phase2/loop
schedule clear skinwalker:phase3/loop
schedule clear skinwalker:phase2/play_ambient_sounds

# Reset game state
scoreboard players set #phase skinwalker.phase 0

# Clear effects from all players
effect clear @a

# Set to day and clear weather
time set day
weather clear

# Reset difficulty
difficulty normal

# Remove bossbar
bossbar remove skinwalker:phase

# Give players some time to see the end message before resetting
schedule function skinwalker:game/reset 10s replace
