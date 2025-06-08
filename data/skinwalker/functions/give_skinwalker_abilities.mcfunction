# Give skinwalker their abilities
# Core ability items (Claws, Disguise Head) are now exclusively granted by skinwalker:assign_skinwalker.
# This function remains for any other setup if needed in the future, but item grants are commented out.

# give @s minecraft:compass{display:{Name:'{"text":"Disguise Selector","color":"red","italic":false}',Lore:['{"text":"Right-click to select a disguise","color":"gray","italic":false}']},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:63} 1
# give @s minecraft:clock{display:{Name:'{"text":"Night Vision","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to toggle night vision","color":"gray","italic":false}']},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:63} 1
# give @s minecraft:ender_pearl{display:{Name:'{"text":"Phase Shift","color":"dark_purple","italic":false}',Lore:['{"text":"Right-click to become intangible for 5 seconds","color":"gray","italic":false}']},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:63} 1

# Ensure the skinwalker tag is present if this function is called, though assign_skinwalker should also do this.
tag @s add skinwalker

# Set ability cooldowns
scoreboard players set @s skinwalker.ability_cooldown 0
scoreboard players set @s skinwalker.ability_duration 0

tellraw @s ["",{"text":"[","color":"dark_red"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_red"},{"text":"You are a ","color":"red"},{"text":"Skinwalker","color":"dark_red","bold":true},"\n",
{"text":"Blend in with the ","color":"red"},{"text":"Survivors","color":"green"},{"text":" and eliminate them one by one!","color":"red"},"\n",
{"text":"Use your ","color":"red"},{"text":"Disguise Selector","color":"white"},{"text":" to take on the appearance of other players.","color":"red"},"\n",
{"text":"Press ","color":"red"},{"text":"F","color":"white"},{"text":" to open your inventory and access your abilities.","color":"red"}]
