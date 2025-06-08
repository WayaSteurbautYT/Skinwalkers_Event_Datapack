# Check if morning has come (6am)
# If so, transition to Phase 3

# Check if it's morning (time 0-23999 is day)
# If it's day and we're in phase 2, transition to phase 3
execute if score #time 1 matches 0..23999 unless score #phase skinwalker.phase matches 3 run function skinwalker:phase3/start
