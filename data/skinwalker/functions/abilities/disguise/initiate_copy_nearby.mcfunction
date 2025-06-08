# Function: skinwalker:abilities/disguise/initiate_copy_nearby
# Called from: Disguise menu (use_disguise_compass)
# Action: Starts the process of copying a nearby player's identity.

# Cooldown should have been set by items/use_disguise_compass.mcfunction already.
# This function calls the previously refactored logic for copying nearby players.
# abilities/disguise/use will set its own timers and tags.
# It also sets skinwalker.disguise_cooldown, which is a bit redundant here but okay.
function skinwalker:abilities/disguise/use
