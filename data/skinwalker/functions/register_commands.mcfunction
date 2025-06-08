# Register start command
execute unless data storage skinwalker:commands {start:1b} run tellraw @a[tag=op] ["",{"text":"[","color":"yellow"},{"text":"!","color":"gold","bold":true},{"text":"] ","color":"yellow"},{"text":"Registering Skinwalker commands...","color":"gold"}]

execute unless data storage skinwalker:commands {start:1b} run tellraw @a[tag=op] ["",{"text":"[","color":"yellow"},{"text":"!","color":"gold","bold":true},{"text":"] ","color":"yellow"},{"text":"Use ","color":"gold"},{"text":"/function skinwalker:start","color":"white"},{"text":" to start the game","color":"gold"}]

data merge storage skinwalker:commands {start:1b}
