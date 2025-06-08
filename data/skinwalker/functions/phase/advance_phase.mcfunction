# Advance to the next phase
scoreboard players add #phase skinwalker.phase 1

# Reset phase timer
scoreboard players set #phase_timer skinwalker.temp 0

# Run phase-specific setup - Corrected paths
execute if score #phase skinwalker.phase matches 1 run function skinwalker:phase1/setup
execute if score #phase skinwalker.phase matches 2 run function skinwalker:phase2/setup
execute if score #phase skinwalker.phase matches 3 run function skinwalker:phase3/setup

# Update bossbar
execute if score #phase skinwalker.phase matches 1 run bossbar set skinwalker:phase name ["",{"text":"Phase 1: ","color":"green"},{"text":"Survival"}]
execute if score #phase skinwalker.phase matches 2 run bossbar set skinwalker:phase name ["",{"text":"Phase 2: ","color":"red"},{"text":"Showdown"}]
execute if score #phase skinwalker.phase matches 3 run bossbar set skinwalker:phase name ["",{"text":"Phase 3: ","color":"dark_red"},{"text":"Finale"}]

# Update bossbar value
execute run bossbar set skinwalker:value #phase skinwalker.phase
