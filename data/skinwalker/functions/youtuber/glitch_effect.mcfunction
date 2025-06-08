# YouTuber starts glitching out

execute as @a[tag=youtuber] at @s run particle minecraft:entity_effect ~ ~1 ~ 0.5 1 0.5 0.1 100
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1 0.8

# Random chance to transform into Skinwalker
execute as @a[tag=youtuber] run scoreboard players set #transform_chance skinwalker.temp 0..4

# 40% chance to transform
execute as @a[tag=youtuber,scores={skinwalker.temp=0..1}] run function skinwalker:youtuber/transform_into_skinwalker

# 60% chance to recover
execute as @a[tag=youtuber,scores={skinwalker.temp=2..4}] run function skinwalker:youtuber/recover_from_glitch
