# Test function to verify all game mechanics

tellraw @a ["",{"text":"=== SKINWALKER GAME TEST ===","color":"gold"}]

# Test role assignment
execute as @a[limit=1] run function skinwalker:assign_skinwalker
execute as @a[limit=1] run function skinwalker:assign_survivor

tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Assigned test roles to two players"}]

# Test abilities
execute as @a[team=Skinwalker,limit=1] run function skinwalker:abilities/disguise/use
tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Tested Disguise ability"}]

# Test task completion
execute as @a[team=Survivor,limit=1] run function skinwalker:tasks/complete_task_mine_ores
tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Tested task completion"}]

# Test emergency beacon
execute as @a[team=Survivor,limit=1] run function skinwalker:items/emergency_beacon
tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Tested Emergency Beacon"}]

# Test win conditions
scoreboard players set #completed_tasks skinwalker.tasks 100
function skinwalker:check_tasks
tellraw @a ["",{"text":"[TEST]","color":"yellow"},{"text":" Tested win condition check"}]

# Reset test state
scoreboard players set #completed_tasks skinwalker.tasks 0
tellraw @a ["",{"text":"=== TEST COMPLETE ===","color":"green"}]
