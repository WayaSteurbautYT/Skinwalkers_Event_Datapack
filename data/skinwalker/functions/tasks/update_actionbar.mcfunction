# Update the player's actionbar with task progress
# This function should be called every second or so

# Only show for survivors in Phase 1
execute as @a[tag=survivor,scores={skinwalker.phase=1}] run {
    # Get current task progress
    scoreboard players set #completed skinwalker.temp 0
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_mine_ores
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_craft_items
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_kill_mobs
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_travel_distance
    scoreboard players add #completed skinwalker.temp @s skinwalker.task_build_structure
    
    # Show progress in actionbar
    title @s actionbar [
        "",
        {"text":"[","color":"dark_gray"},
        {"score":{"name":"#completed","objective":"skinwalker.temp"},"color":"green"},
        {"text":"/5 ","color":"gray"},
        {"text":"Tasks ","color":"white"},
        {"text":"[","color":"dark_gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_mine_ores"},"color":"gold"},
        {"text":"/","color":"gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_mine_ores_required"},"color":"dark_gray"},
        {"text":"] ","color":"dark_gray"},
        {"text":"[","color":"dark_gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_craft_items"},"color":"aqua"},
        {"text":"/","color":"gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_craft_items_required"},"color":"dark_gray"},
        {"text":"] ","color":"dark_gray"},
        {"text":"[","color":"dark_gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_kill_mobs"},"color":"red"},
        {"text":"/","color":"gray"},
        {"score":{"name":"@s","objective":"skinwalker.task_kill_mobs_required"},"color":"dark_gray"},
        {"text":"]","color":"dark_gray"}
    ]
}
