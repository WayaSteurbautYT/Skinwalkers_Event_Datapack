# Function: skinwalker:tasks/detection/mined_stone_block
# Purpose: Called when a player mines any stone block (intended to be triggered by an advancement).
# Increments progress for the "Mine Stone" task if active.

# Placeholder: Revoke the advancement that triggered this function to allow it to trigger again.
# Example: advancement revoke @s only skinwalker:technical/mine_any_stone_trigger

# Check if the player has the "Mine Stone" task active
execute if entity @s[tag=task_mine_stone] run {
    # Increment their progress for mining stone
    scoreboard players add @s skinwalker.task_mine_stone 1

    # Provide action bar feedback on progress
    # (Requires skinwalker.task_mine_stone_required to be set on the player when task is assigned)
    execute store result score #current_mined skinwalker.temp run scoreboard players get @s skinwalker.task_mine_stone
    execute store result score #required_mined skinwalker.temp run scoreboard players get @s skinwalker.task_mine_stone_required

    title @s actionbar ["",{"score":{"name":"#current_mined","objective":"skinwalker.temp"},"color":"yellow"},{"text":" / ","color":"gray"},{"score":{"name":"#required_mined","objective":"skinwalker.temp"},"color":"yellow"},{"text":" Stone Mined","color":"white"}]

    # Optional: Play a subtle sound for each increment
    playsound minecraft:block.stone.hit master @s ~ ~ ~ 0.3 1.5
}
