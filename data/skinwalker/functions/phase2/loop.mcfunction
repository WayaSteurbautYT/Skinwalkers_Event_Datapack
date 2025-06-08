# Main loop for Phase 2
# Only run if we're still in phase 2
execute unless score #phase skinwalker.phase matches 2 run return 0

# Update time score
scoreboard players set #time 1 = time 1

# Check if morning has come (6am)
execute if score #time 1 matches 0..23999 run function skinwalker:phase2/check_morning

# Random events
execute if score #random 1 matches ..5 run function skinwalker:phase2/random_events

# Update bossbar
bossbar set skinwalker:value 2

# Reschedule
schedule function skinwalker:phase2/loop 1s replace
