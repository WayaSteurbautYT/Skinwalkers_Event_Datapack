# skinwalker:abilities/claws/try_attack
# Called when a Skinwalker attacks an entity while holding the Skinwalker Claws.
# This function acts as a wrapper to call the actual claw attack logic and handle advancement revocation.

# Revoke the advancement immediately to allow re-triggering for subsequent attacks
advancement revoke @s only skinwalker:abilities/claw_attack_trigger

# Call the main claws ability function
# This function (claws/use.mcfunction or an intermediary) should check cooldowns,
# identify the target if necessary (though player_hurt_entity gives some context),
# and apply effects/damage.
function skinwalker:abilities/claws/use

# Note: The advancement 'player_hurt_entity' provides context about the victim.
# The 'claws/use.mcfunction' uses '@p[limit=1,sort=nearest,distance=..5,team=!Skinwalker]'
# which might re-target. This could be refined to use the actual entity hurt by the event
# if a more direct targeting system is implemented (e.g., using a marker entity or scoreboard tags
# set by the advancement's reward function if it could pass entity context).
# For now, relying on the existing targeting in 'claws/use.mcfunction'.
