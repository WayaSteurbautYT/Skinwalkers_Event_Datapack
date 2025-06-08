# Open the task list GUI for the player
# This is triggered when a player right-clicks with the Task Tracker

execute as @s[scores={skinwalker.phase=1}] run {
    # Play a click sound
    playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
    
    # Show the task list as a book
    give @s written_book{
        pages:[
            '{"text":"Your Tasks\n\n","color":"black","extra":[{"text":"Mining:\n","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"skinwalker.task_mine_ores"},"color":"gold"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.task_mine_ores_required"},"color":"dark_gray"},{"text":" ores mined\n\n","color":"gray"},{"text":"Crafting:\n","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"skinwalker.task_craft_items"},"color":"aqua"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.task_craft_items_required"},"color":"dark_gray"},{"text":" items crafted","color":"gray"}]}',
            '{"text":"Combat:\n","color":"dark_gray","bold":true,"extra":[{"score":{"name":"@s","objective":"skinwalker.task_kill_mobs"},"color":"red"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.task_kill_mobs_required"},"color":"dark_gray"},{"text":" mobs defeated\n\n","color":"gray"},{"text":"Exploration:\n","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"skinwalker.task_travel_distance"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.task_travel_distance_required"},"color":"dark_gray"},{"text":" blocks traveled\n\n","color":"gray"},{"text":"Building:\n","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"skinwalker.task_build_structure"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"skinwalker.task_build_structure_required"},"color":"dark_gray"},{"text":" structures built","color":"gray"}]}'
        ],
        title:"Task List",
        author:"Skinwalker Event",
        display:{Lore:['{"text":"Right-click to view your tasks","color":"gray","italic":true}']}
    } 1
    
    # Clear the book after a short delay
    schedule function skinwalker:gui/clear_task_book 1s replace
}
