# skinwalker:abilities/phase_shift/try_use
# Called when a Skinwalker right-clicks the Skinwalker Claws (stick with CustomModelData:1001).
# This function acts as a wrapper to call the actual phase shift logic and handle advancement revocation.

# Revoke the advancement immediately to allow re-triggering
advancement revoke @s only skinwalker:abilities/use_claws_phase_shift

# Call the main phase shift function
# This function should check cooldowns and execute the ability.
function skinwalker:abilities/phase_shift/use

# Note: The actual item consumption (if any) or specific item checks beyond the advancement's NBT
# should be handled within skinwalker:abilities/phase_shift/use or related functions.
# For Phase Shift via Claws, there's no item consumption.
