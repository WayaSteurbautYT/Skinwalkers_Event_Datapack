# Set player's skin to a random Skinwalker variant
# Requires Identity mod for skin changing

execute store result score #skin_variant skinwalker.temp run scoreboard players get #random skinwalker.temp 1 11

execute if score #skin_variant skinwalker.temp matches 1 run skin player @s set https://files.catbox.moe/cb8c8a.png  # Normal

execute if score #skin_variant skinwalker.temp matches 2 run skin player @s set https://files.catbox.moe/qxdjf2.png  # Waya

execute if score #skin_variant skinwalker.temp matches 3 run skin player @s set https://files.catbox.moe/7fs0c4.png  # Lucas

execute if score #skin_variant skinwalker.temp matches 4 run skin player @s set https://files.catbox.moe/5mbyi0.png  # Babi

execute if score #skin_variant skinwalker.temp matches 5 run skin player @s set https://files.catbox.moe/9gf4xa.png  # Dream

execute if score #skin_variant skinwalker.temp matches 6 run skin player @s set https://files.catbox.moe/6v0y8i.png  # TechnoBlade

execute if score #skin_variant skinwalker.temp matches 7 run skin player @s set https://files.catbox.moe/v2ibhg.png  # Craftee

execute if score #skin_variant skinwalker.temp matches 8 run skin player @s set https://files.catbox.moe/o456fl.png  # MrBeast

execute if score #skin_variant skinwalker.temp matches 9 run skin player @s set https://files.catbox.moe/fbjewy.png  # PrestonPlays

execute if score #skin_variant skinwalker.temp matches 10 run skin player @s set https://files.catbox.moe/zq4kyt.png  # I am Steve

execute if score #skin_variant skinwalker.temp matches 11 run identity equip @s minecraft:enderman  # Enderman form
