# Skinwalker Game Mode - Complete Guide

## Table of Contents
1. [Game Overview](#game-overview)
2. [Roles](#roles)
   - [Survivor](#survivor)
   - [Skinwalker](#skinwalker)
   - [YouTuber](#youtuber)
3. [Starting the Game](#starting-the-game)
4. [Items and Abilities](#items-and-abilities)
   - [Survivor Items](#survivor-items)
   - [Skinwalker Abilities](#skinwalker-abilities)
   - [YouTuber Perks](#youtuber-perks)
5. [Commands](#commands)
   - [Player Commands](#player-commands)
   - [Admin Commands](#admin-commands)
6. [Winning Conditions](#winning-conditions)
7. [Tips and Strategies](#tips-and-strategies)

## Game Overview
Skinwalker is a multiplayer survival-horror game mode where players are divided into two teams: Survivors and Skinwalkers. Survivors must complete tasks while avoiding detection and elimination by the Skinwalkers, who can disguise themselves as other players.

## Roles

### Survivor
- **Goal**: Complete all tasks or eliminate all Skinwalkers
- **Abilities**:
  - Complete tasks to win
  - Use items to detect and fend off Skinwalkers
  - Work with other Survivors
- **Starting Items**:
  - Task Tracker (Compass)
  - Basic weapons and food

### Skinwalker
- **Goal**: Eliminate all Survivors
- **Abilities**:
  - Disguise as other players
  - Phase Shift (short-range teleport)
  - Claw Attack (melee)
  - Enhanced strength and speed in Phase 2
- **Special**:
  - Can see other Skinwalkers through walls
  - Disguises are disabled in Phase 2

### YouTuber
- **Special Role**: Enhanced Survivor with additional perks
- **Perks**:
  - Better starting gear
  - Increased health or speed
  - Unique cosmetic effects
  - Special abilities (configurable)
- **Note**: Only available if enabled in server settings

## Starting the Game

### Requirements
- Minecraft 1.20.1
- Fabric Loader
- Required mods (Identity, Skin Changer, Carry On)

### Setup Commands
```mcfunction
# Start the game (Admin only)
/function skinwalker:start_event

# Force start with specific settings (Admin only)
/scoreboard players set #game_phase skinwalker.phase 1

# Reset the game (Admin only)
/function skinwalker:reset_game

# Set player as YouTuber (Admin only)
/scoreboard players set <player> skinwalker.youtuber 1
```

## Items and Abilities

### Survivor Items

| Item | Description | How to Use |
|------|-------------|------------|
| Task Tracker (Compass) | Shows your current tasks | Right-click to check tasks |
| Emergency Beacon | Reveals nearby Skinwalkers | Place and right-click |
| First Aid Kit | Heals you or teammates | Right-click on player |
| Flashlight | Lights up dark areas | Hold in off-hand |
| Speed Boost | Temporary speed increase | Right-click to use |

### Skinwalker Abilities

| Ability | Description | Command | Cooldown |
|---------|-------------|----------|-----------|
| Disguise | Take on another player's appearance | `/disguise select` | 30s after removal |
| Phase Shift | Short-range teleport | Right-click with Claws | 15s |
| Claw Attack | Melee attack | Left-click with Claws | 1s |
| Night Vision | See in the dark | Automatic | Always |

### YouTuber Perks
- Golden name in chat
- Special particle effects
- Unique starting items (configurable)
- Increased interaction range
- Custom join/leave messages

## Commands

### Player Commands
```mcfunction
# Disguise Commands
/disguise select - Open disguise selector
/disguise remove - Remove current disguise
/disguise info - Check disguise status

# Game Commands
/trigger skinwalker_help - Show help menu
/trigger skinwalker_tasks - Show current tasks
/trigger skinwalker_team - Show your team

# General Commands
/help - Show available commands
/msg - Private message other players
```

### Admin Commands
```mcfunction
# Game Control
/function skinwalker:start_event - Start the game
/function skinwalker:reset_game - Reset the game
/scoreboard players set #game_phase skinwalker.phase 1 - Set to Phase 1
/scoreboard players set #game_phase skinwalker.phase 2 - Set to Phase 2

# Player Management
/team join Survivors <player> - Add to Survivors
/team join Skinwalkers <player> - Add to Skinwalkers
/scoreboard players set <player> skinwalker.youtuber 1 - Make YouTuber

# Debug
/function skinwalker:debug_info - Show debug info
/scoreboard objectives list - List all scoreboards
```

## Winning Conditions

### Survivors Win When:
- All tasks are completed
- All Skinwalkers are eliminated

### Skinwalkers Win When:
- All Survivors are eliminated
- Time runs out (if enabled)

## Tips and Strategies

### For Survivors:
- Stick together in groups
- Complete tasks efficiently
- Watch for suspicious behavior
- Use Emergency Beacons strategically
- Trust no one completely

### For Skinwalkers:
- Use disguises wisely
- Isolate your targets
- Coordinate with other Skinwalkers
- Use Phase Shift to escape danger
- In Phase 2, use your enhanced abilities aggressively

### For YouTubers:
- Use your influence to organize Survivors
- Your perks can turn the tide of battle
- Be a leader or a decoy
- Your death is more impactful, so be careful

## Additional Notes
- The game automatically handles role assignment
- Some features may be configurable by server admins
- Check server-specific rules for any modifications
- Report any bugs to the server staff
