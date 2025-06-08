# Skinwalker Event - Admin Guide

This guide provides server administrators with information about managing and troubleshooting the Skinwalker game mode, with a focus on the Disguise System.

## Disguise System Configuration

### Scoreboard Objectives
- `skinwalker.ability_duration`: Tracks remaining disguise duration in ticks (20 ticks = 1 second)
- `skinwalker.ability_cooldown`: Tracks cooldown between disguise uses
- `skinwalker.temp`: Used for temporary calculations

### Tags
- `disguised`: Applied to Skinwalkers who are currently disguised
- `disguised_as`: Used to track which player a Skinwalker is disguised as
- `selecting_disguise`: Indicates a player is in the disguise selection menu

### Data Storage
- `DisguiseTarget`: UUID of the player being mimicked
- `DisguiseName`: Display name of the player being mimicked

## Admin Commands

### Force Remove Disguise
```mcfunction
execute as @a[tag=skinwalker,tag=disguised] run function skinwalker:abilities/disguise/remove_disguise
```

### Reset All Cooldowns
```mcfunction
execute as @a[tag=skinwalker] run scoreboard players set @s skinwalker.ability_cooldown 0
```

### Check Disguise Status
```mcfunction
execute as @a[tag=skinwalker] run function skinwalker:commands/disguise/info
```

## Common Issues

### Disguise Not Working
1. Check if the player has the `skinwalker` tag
2. Verify the game phase is not Phase 2 (disguises are disabled in Phase 2)
3. Check if the target player is online and alive
4. Ensure the player is within 20 blocks of the target

### Disguise Persists After Death
Disguises are meant to persist through death. If this is causing issues, run:
```mcfunction
execute as @a[tag=skinwalker] run function skinwalker:abilities/disguise/remove_disguise
```

### Disguise Selector Not Showing Players
1. Ensure there are living Survivors within 20 blocks
2. Check if the player is in Phase 1 (selector is disabled in Phase 2)
3. Verify the player has the `skinwalker` tag

## Performance Considerations
- The disguise system uses scheduled functions to check timers
- Each disguised player adds minimal overhead
- The disguise selector refreshes every second when active

## Customization

### Change Disguise Duration
Edit `skinwalker:abilities/disguise/check_disguise_timer.mcfunction` and change the initial duration (6000 ticks = 5 minutes).

### Modify Cooldown
Edit the cooldown value in `skinwalker:commands/disguise/remove.mcfunction` (default: 600 ticks = 30 seconds).

### Adjust Disguise Range
Modify the distance check in `skinwalker:items/disguise_selector.mcfunction` (currently 20 blocks).
