# Disguise System Testing Plan

This document outlines the test cases to verify the Disguise System works as expected.

## Test Environment
- Minecraft 1.20.1
- Fabric Loader
- Required mods installed
- At least 3 players (1 Skinwalker, 2 Survivors)

## Test Cases

### 1. Disguise Selection
- [ ] Skinwalker can use `/disguise select` to open GUI
- [ ] GUI shows nearby Survivors (within 20 blocks)
- [ ] Clicking a Survivor applies the disguise
- [ ] Player model updates to match the target
- [ ] Name in chat/tab list updates to match the target
- [ ] Disguise duration starts counting down

### 2. Disguise Persistence
- [ ] Disguise persists through death
- [ ] Disguise is restored on respawn
- [ ] Disguise persists through reconnects

### 3. Disguise Removal
- [ ] `/disguise remove` correctly removes the disguise
- [ ] Original appearance is restored
- [ ] Cooldown is applied after removal
- [ ] Cannot re-disguise during cooldown

### 4. Disguise Expiration
- [ ] Disguise automatically expires after 5 minutes
- [ ] Player is notified before expiration
- [ ] Appearance reverts to normal after expiration
- [ ] Cooldown is applied after expiration

### 5. Phase 2 Behavior
- [ ] Disguises are automatically removed when Phase 2 starts
- [ ] Cannot use disguise abilities in Phase 2
- [ ] Appropriate message is shown to the player

### 6. Edge Cases
- [ ] Target player leaves the game while disguised as them
- [ ] Target player dies while disguised as them
- [ ] Multiple Skinwalkers disguising as the same player
- [ ] Disguising while already disguised
- [ ] Using `/disguise remove` while not disguised

## Performance Testing
- [ ] No noticeable lag with multiple disguised players
- [ ] Disguise selector GUI responds quickly
- [ ] No memory leaks after multiple disguise cycles

## Multiplayer Testing
- [ ] All players see the disguised player correctly
- [ ] Disguise status is synchronized across all clients
- [ ] No desync issues with player models

## Expected Behavior
- Disguises should be visually convincing
- No way to tell a disguised player apart from a real Survivor
- All disguise actions should have appropriate visual/audio feedback
- No exploits or ways to bypass cooldowns

## Reporting Issues
When reporting issues, please include:
1. Minecraft version
2. Installed mods
3. Steps to reproduce
4. Any error messages
5. Screenshots/videos if possible
