# Function: skinwalker:items/reveal_skinwalker
# Purpose: Called for each Skinwalker detected by the Emergency Beacon.
# Applies effects to this specific Skinwalker (@s).

# --- Visual Effects ---
# Apply a very distinct particle effect directly to the Skinwalker
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.1 50 force @s
particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force @s
particle minecraft:flame ~ ~1 ~ 0.2 0.5 0.2 0.01 100 force @s

# Make the Skinwalker glow intensely for a short duration (e.g., 10 seconds)
# The emergency_beacon already gives a general glow to entities nearby.
# This will make the skinwalker glow more, or refresh it just for them.
effect give @s minecraft:glowing 10 1 true # Amplifier 1 for more intensity (200 ticks = 10 seconds)

# --- Auditory Effects ---
# Play a loud, distinct sound that seems to emanate from the Skinwalker
playsound minecraft:entity.warden.roar master @a[distance=..20] ~ ~ ~ 1 1.2 # Play for everyone near the Skinwalker (using @a at Skinwalker's location)
execute at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1 0.8 # Play specifically for the Skinwalker too, make it positional to them

# --- Gameplay Effects (Optional - for balance consideration) ---
# Briefly impair the Skinwalker
# effect give @s minecraft:slowness 5 1 true # 5 seconds of Slowness II
# effect give @s minecraft:mining_fatigue 10 2 true # 10 seconds of Mining Fatigue III

# --- Notification ---
# Announce this specific Skinwalker's reveal to non-Skinwalkers nearby them.
# The general beacon message is already sent by "emergency_beacon". This is more specific.
execute at @s run tellraw @a[distance=..20,team=!Skinwalker,tag=!skinwalker] ["",{"text":"[BEACON ALERT] ","color":"red","bold":true},{"selector":"@s","color":"dark_red"},{"text":" has been exposed by the beacon!","color":"yellow"}]

# Title message for the revealed Skinwalker
title @s title {"text":"REVEALED!","color":"dark_red","bold":true}
title @s subtitle {"text":"The beacon has exposed you!","color":"red"}
