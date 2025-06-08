# Function: skinwalker:game/handle_item_clicks
# Called from game/tick.mcfunction
# Purpose: Detects right-clicks with a base item (e.g., carrot_on_a_stick) and dispatches to specific item functions.

# Configuration:
# Base item for click detection: minecraft:carrot_on_a_stick
# Scoreboard for click detection: sw.item_click

# --- Adrenaline Shot (Example) ---
# Item NBT: {CustomModelData:3001}
# Function: skinwalker:items/use_adrenaline_shot
execute as @a[scores={sw.item_click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:3001}}}] run function skinwalker:items/use_adrenaline_shot

# --- Skinwalker Claw (Example - Assuming it's an item for now) ---
# Item NBT: {CustomModelData:1001} # EXAMPLE CMD
# Function: skinwalker:abilities/claws/use
execute as @a[scores={sw.item_click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:1001}}}] run function skinwalker:abilities/claws/use

# --- Phase Shift Item (Example) ---
# Item NBT: {CustomModelData:1002} # EXAMPLE CMD
# Function: skinwalker:items/phase_shift
execute as @a[scores={sw.item_click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:1002}}}] run function skinwalker:items/phase_shift

# --- Disguise Item (Example) ---
# Item NBT: {CustomModelData:1003} # EXAMPLE CMD
# Function: skinwalker:items/use_disguise_compass
execute as @a[scores={sw.item_click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:1003}}}] run function skinwalker:items/use_disguise_compass
# Add more item checks here following the pattern:
# execute as @a[scores={sw.item_click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:<YOUR_CMD_HERE>}}}] run function <your_item_function>


# Reset the click score for all players who triggered it
scoreboard players reset @a[scores={sw.item_click=1..}] sw.item_click
