# Random events that can happen during Phase 2
# Only run if we're in phase 2
execute unless score #phase skinwalker.phase matches 2 run return 0

# Random event selection (1-10)
scoreboard players set #event skinwalker.temp 1..10

# Event 1: Spawn phantoms
#execute if score #event skinwalker.temp matches 1 run function skinwalker:events/spawn_phantoms

# Event 2: Lightning storm
#execute if score #event skinwalker.temp matches 2 run function skinwalker:events/lightning_storm

# Event 3: Random teleport
#execute if score #event skinwalker.temp matches 3 run function skinwalker:events/random_teleport

# Event 4: Give random effect
#execute if score #event skinwalker.temp matches 4 run function skinwalker:events/random_effect

# Event 5: Spawn mobs
#execute if score #event skinwalker.temp matches 5 run function skinwalker:events/spawn_mobs

# Event 6: YouTuber message
#execute if score #event skinwalker.temp matches 6 run function skinwalker:events/youtuber_message

# Event 7: Power surge (random redstone activation)
#execute if score #event skinwalker.temp matches 7 run function skinwalker:events/power_surge

# Event 8: Item drop
#execute if score #event skinwalker.temp matches 8 run function skinwalker:events/item_drop

# Event 9: Sound effect
#execute if score #event skinwalker.temp matches 9 run function skinwalker:events/random_sound

# Event 10: No event (do nothing)
# This is the default case and doesn't need to be handled
