# Main loop for Phase 3 (Final Showdown)
# Only run if we're still in phase 3
execute unless score #phase skinwalker.phase matches 3 run return 0

# Check win/lose conditions
execute if entity @a[tag=survivor] run function skinwalker:phase3/check_survivors
execute if entity @a[tag=skinwalker] run function skinwalker:phase3/check_skinwalkers

# Update bossbar
bossbar set skinwalker:value 3

# Random events during final battle
execute if score #random 1 matches ..5 run function skinwalker:phase3/random_events

# Reschedule
schedule function skinwalker:phase3/loop 1s replace
