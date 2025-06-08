# Clear the task book from the player's inventory
# This is called after the player views their tasks

# Clear any written books with the title "Task List"
clear @s written_book{display:{Name:'{"text":"Task List"}'}} 1

# Give the Task Tracker back if it was removed
clear @s minecraft:compass{display:{Name:'{"text":"Task Tracker"}'}} 0
give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"green","italic":false}'},Enchantments:[{id:binding_curse,lvl:1}],HideFlags:32} 1
