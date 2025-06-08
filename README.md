# Skinwalker Game Mode for Minecraft 1.20.1

A thrilling multiplayer game mode where players are either Survivors trying to complete tasks or Skinwalkers trying to eliminate them.

## Features

- Team-based gameplay (Survivors vs Skinwalkers)
- Random role assignment
- Special abilities for each role
- Task system for Survivors
- Stealth mechanics for Skinwalkers
- Win conditions for both teams
- Spectator mode for dead players

## Requirements

- Minecraft Java Edition 1.20.1
- Fabric Loader
- Required Mods:
  - Identity (for skin changing)
  - Skin Changer (for skin changing)
  - Carry On (for entity interaction)

## Installation

1. Install Fabric Loader for Minecraft 1.20.1
2. Install required mods in your `mods` folder
3. Place the `SkinwalkerEvent` folder in your world's `datapacks` folder
4. Start or reload your world
5. Run `/reload` in-game

## How to Play

### Starting the Game
1. Have all players join the world
2. An operator should run: `/function skinwalker:start_event`
3. Players will be automatically assigned roles (Survivor or Skinwalker)
4. The game will begin after a short countdown

### Survivors
- Complete tasks shown in your Task Tracker (compass)
- Work together with other Survivors
- Use the Emergency Beacon (clock) to reveal nearby Skinwalkers
- Survive until all tasks are complete

### Skinwalkers
- Blend in with Survivors using the Disguise System
- Use your abilities to eliminate Survivors
- Right-click with your Claws to attack
- Use Ender Pearls to teleport
- Prevent Survivors from completing their tasks

## Disguise System (Skinwalkers)

### Commands
- `/disguise select` - Open the disguise selector GUI to choose a nearby Survivor to mimic
- `/disguise remove` - Remove your current disguise
- `/disguise info` - Check your current disguise status and cooldowns

### How to Use
1. **Selecting a Disguise**
   - Use `/disguise select` to open the disguise menu
   - Click on a Survivor's name from the list
   - You must be within 20 blocks of the target
   - The disguise will last for 5 minutes

2. **Maintaining Your Disguise**
   - Your disguise will automatically be removed after the duration expires
   - You can remove it early with `/disguise remove`
   - If you die while disguised, your disguise will be restored when you respawn

3. **Disguise Limitations**
   - Disguises are disabled in Phase 2 of the game
   - There's a 30-second cooldown after removing a disguise
   - You can only disguise as living Survivors
   - Some actions (like attacking) may reveal your true nature

4. **Tips**
   - Use disguises to get close to Survivors undetected
   - Be careful not to act suspiciously while disguised
   - Remove your disguise before it expires to avoid being caught off-guard
   - Use `/disguise info` to check your remaining disguise time

### Commands
- `/trigger skinwalker_help` - Show help menu
- `/function skinwalker:start_event` - Start a new game
- `/function skinwalker:reset_game` - Reset the game

## Game Mechanics

### Tasks
Survivors must complete a series of tasks to win. Tasks are randomly assigned and can be checked using the Task Tracker (compass).

### Abilities
- **Survivors**:
  - Emergency Beacon: Reveals nearby Skinwalkers
  - Self Defense: Basic weapons to fight back

- **Skinwalkers**:
  - Claws: Right-click to attack
  - Phase Shift: Teleport behind targets
  - Invisibility: Blend in with the environment

### Winning Conditions
- **Survivors Win**: Complete all tasks before being eliminated
- **Skinwalkers Win**: Eliminate all Survivors

## Configuration
Edit the `#phase` scoreboard to adjust game phases if needed:
- 0: Setup
- 1: Game in progress
- 10: Game over

## Troubleshooting
- If the game doesn't start, ensure all required mods are installed
- Run `/reload` if commands aren't working
- Check server logs for any errors

## Credits

Created by WayaSteurbautYTR
Special thanks to all the YouTubers referenced in this datapack
