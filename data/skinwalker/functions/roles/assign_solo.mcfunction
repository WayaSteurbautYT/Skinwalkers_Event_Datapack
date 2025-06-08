# Single player mode - assign YouTuber role
# In solo mode, the player is a YouTuber with special abilities to complete tasks

tag @s add youtuber
scoreboard players set @s skinwalker.role 3
tellraw @s ["",{"text":"You are a ","color":"gray"},{"text":"YouTuber","color":"blue","bold":true},{"text":"!\nComplete all tasks to win!","color":"gray"}]

give @s minecraft:compass{display:{Name:'{"text":"Task Tracker","color":"blue","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1001} 1
give @s minecraft:clock{display:{Name:'{"text":"Phase Timer","color":"gold","italic":false}'},HideFlags:32,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],CustomModelData:1002} 1
