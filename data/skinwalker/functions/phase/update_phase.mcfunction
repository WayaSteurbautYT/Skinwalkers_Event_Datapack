# Manages the active phase's per-tick updates and timer

# Increment current phase timer
# This timer is used by phaseX/update functions and phase/check_phase_transition for phase duration checks.
scoreboard players add #phase_timer skinwalker.temp 1

# Execute the current phase's update function
execute if score #phase skinwalker.phase matches 1 run function skinwalker:phase1/update
execute if score #phase skinwalker.phase matches 2 run function skinwalker:phase2/update
execute if score #phase skinwalker.phase matches 3 run function skinwalker:phase3/update

# Note: The old phase/update_phase.mcfunction also had direct calls to phaseX/start
# and game end based on #phaseX_duration. This logic is now primarily handled by
# phase/check_phase_transition.mcfunction, which calls phase/advance_phase.
# phase/advance_phase then calls phaseX/setup and phaseX/start for the new phase.
# This makes the transition sequence more robust:
# 1. Condition met (timer up in check_phase_transition, or tasks done in phaseX/update)
# 2. advance_phase is called.
# 3. advance_phase increments phase number, calls phaseX/setup (sets new duration), calls phaseX/start (intro messages).
# 4. update_phase (this file) continues to run the new phase's phaseX/update.
