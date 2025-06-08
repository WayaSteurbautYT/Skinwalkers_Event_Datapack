# Handle Skinwalker abilities and cooldowns

# Check for right-click with ability items and handle cooldowns
execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Skinwalker Claws"}}}},scores={skinwalker.role=1,skinwalker.claws_cooldown=0}] at @s run function skinwalker:abilities/claws/use
execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Phase Shift"}}}},scores={skinwalker.role=1,skinwalker.phase_cooldown=0}] at @s run function skinwalker:abilities/phase_shift/use
execute as @a[nbt={SelectedItem:{tag:{display:{Name:'{"text":"Disguise"}}}},scores={skinwalker.role=1,skinwalker.disguise_cooldown=0}] at @s run function skinwalker:abilities/disguise/select

# Cooldown management (handled in ticks, 20 ticks = 1 second)
scoreboard players remove @a[scores={skinwalker.claws_cooldown=1..}] skinwalker.claws_cooldown 1
scoreboard players remove @a[scores={skinwalker.phase_cooldown=1..}] skinwalker.phase_cooldown 1
scoreboard players remove @a[scores={skinwalker.disguise_cooldown=1..}] skinwalker.disguise_cooldown 1

# Update item lore to show cooldowns
execute as @a[scores={skinwalker.claws_cooldown=1..}] run {
    item modify entity @s weapon.mainhand skinwalker:claws_cooldown
}
execute as @a[scores={skinwalker.phase_cooldown=1..}] run {
    item modify entity @s weapon.mainhand skinwalker:phase_cooldown
}
execute as @a[scores={skinwalker.disguise_cooldown=1..}] run {
    item modify entity @s weapon.mainhand skinwalker:disguise_cooldown
}
