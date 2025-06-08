# skinwalker:abilities/disguise/start_selection
# Called when a Skinwalker right-clicks the Disguise player head.

# Revoke the advancement immediately to allow re-triggering
advancement revoke @s only skinwalker:abilities/use_disguise_item

# Check if player is already disguised
execute if entity @s[tag=disguised] run {
    tellraw @s {"text":"You are already disguised! Remove your current disguise first.","color":"red"}
    # Optional: Give the item back if it was somehow consumed by the advancement trigger (player heads usually aren't)
    # give @s minecraft:player_head{display:{Name:'{"text":"Disguise","color":"dark_aqua","italic":false}',Lore:['{"text":"Right-click to copy a survivor's appearance","color":"gray"}','{"text":"Cooldown: 30s (after removal)","color":"gray"}']},SkullOwner:"MHF_Question",CustomModelData:1003,HideFlags:1} 1
    playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
    return 0
}

# Check cooldown
# Ensure the objective name matches what's used in assign_skinwalker and game_tick
execute if score @s skinwalker.disguise_cooldown matches 1.. run {
    # Calculate remaining time in seconds for the message
    scoreboard players operation #remaining_ticks skinwalker.temp = @s skinwalker.disguise_cooldown
    scoreboard players operation #remaining_seconds skinwalker.temp = #remaining_ticks skinwalker.temp
    scoreboard players operation #remaining_seconds skinwalker.temp /= #20 skinwalker.global_constants # Assuming #20 holds value 20

    tellraw @s ["",{"text":"Disguise is on cooldown for ","color":"red"},{"score":{"name":"#remaining_seconds","objective":"skinwalker.temp"},"color":"yellow"},{"text":" seconds.","color":"red"}]
    # Optional: Give item back
    # give @s minecraft:player_head{display:{Name:'{"text":"Disguise","color":"dark_aqua","italic":false}',Lore:['{"text":"Right-click to copy a survivor's appearance","color":"gray"}','{"text":"Cooldown: 30s (after removal)","color":"gray"}']},SkullOwner:"MHF_Question",CustomModelData:1003,HideFlags:1} 1
    playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
    return 0
}

# If not disguised and cooldown is 0, proceed with disguise selection
# This is where you would call the function to open the UI for selecting a player to disguise as.
# For now, a placeholder message:
tellraw @s {"text":"Disguise selection UI would open here.","color":"light_purple"}
tellraw @s {"text":"(This would typically call a function like skinwalker:abilities/disguise/open_selector_ui)","color":"gray"}
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

# Example: To integrate with an existing command based system for selection:
# function skinwalker:commands/disguise/select_interface
# Or directly trigger a known command if that's how it's implemented:
# execute as @s run trigger skinwalker_disguise_select

# IMPORTANT: The actual disguise application (tagging @s with 'disguised', 'disguised_as_player', setting 'DisguisedAsName', calling 'identity set')
# and setting the cooldown should happen *after* a successful disguise, not here.
# This function only INITIATES the selection process.
# The cooldown is set by remove_disguise.mcfunction.
# A successful disguise via the (hypothetical) UI would then apply the disguise.
# If a disguise is cancelled or fails, no cooldown is applied from this interaction.

# Note: The GAMEPLAY_GUIDE.md says "/disguise select" is a command.
# This item right-click should ideally trigger the same underlying mechanism as that command.
# If that command is '/trigger skinwalker_disguise_select', you could run:
# execute as @s run trigger skinwalker_disguise_select
# However, ensure that the trigger command itself doesn't re-check cooldowns in a conflicting way.
# For now, leaving it with the placeholder message.
# A more robust solution would be to have this function and the /trigger command both call a common
# 'can_start_disguise_selection' function that checks cooldowns and then opens the UI.

# Placeholder for global constant #20 if not already set up
scoreboard players set #20 skinwalker.global_constants 20
