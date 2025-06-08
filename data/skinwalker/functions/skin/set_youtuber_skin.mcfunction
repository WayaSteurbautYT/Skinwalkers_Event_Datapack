# Set player's skin to a random YouTuber skin or their Skinwalker variant
# Store a random number to determine which YouTuber skin to use
execute store result score #youtuber skinwalker.temp run scoreboard players get #random skinwalker.temp 1 9

# Apply different YouTuber skins based on random number
# Dream
execute if score #youtuber skinwalker.temp matches 1 run skin set @s name Dream
execute if score #youtuber skinwalker.temp matches 1 run scoreboard players set @s skinwalker.youtuber 1

# MrBeast
execute if score #youtuber skinwalker.temp matches 2 run skin set @s name JimmyDonaldson
execute if score #youtuber skinwalker.temp matches 2 run scoreboard players set @s skinwalker.youtuber 2

# Craftee
execute if score #youtuber skinwalker.temp matches 3 run skin set @s name Parker_Games
execute if score #youtuber skinwalker.temp matches 3 run scoreboard players set @s skinwalker.youtuber 3

# PrestonPlays
execute if score #youtuber skinwalker.temp matches 4 run skin set @s name PrestonPlayz
execute if score #youtuber skinwalker.temp matches 4 run scoreboard players set @s skinwalker.youtuber 4

# WayaSteurbaut
execute if score #youtuber skinwalker.temp matches 5 run skin set @s name WayaSteurbautYTR
execute if score #youtuber skinwalker.temp matches 5 run scoreboard players set @s skinwalker.youtuber 5

# Udnof007 (Lucas)
execute if score #youtuber skinwalker.temp matches 6 run skin set @s name Udnof007
execute if score #youtuber skinwalker.temp matches 6 run scoreboard players set @s skinwalker.youtuber 6

# Babi
execute if score #youtuber skinwalker.temp matches 7 run skin player @s set https://files.catbox.moe/ur57tg.png
execute if score #youtuber skinwalker.temp matches 7 run scoreboard players set @s skinwalker.youtuber 7

# Default to Dream if no valid skin was set
execute unless entity @s[nbt={Skin:{}}] run skin set @s name Dream
execute unless entity @s[nbt={Skin:{}}] run scoreboard players set @s skinwalker.youtuber 1

# Store the player's name for later reference
data modify storage skinwalker:youtubers {} set value {}
data modify storage skinwalker:youtubers.{name: @s} set from entity @s CustomName
data modify storage skinwalker:youtubers.{name: @s}.youtuber_id set from entity @s skinwalker.youtuber

# Set the player's display name to match their YouTuber role
execute if score #youtuber skinwalker.temp matches 1 run team modify YouTuber suffix " [Dream]"
execute if score #youtuber skinwalker.temp matches 2 run team modify YouTuber suffix " [MrBeast]"
execute if score #youtuber skinwalker.temp matches 3 run team modify YouTuber suffix " [Craftee]"
execute if score #youtuber skinwalker.temp matches 4 run team modify YouTuber suffix " [PrestonPlays]"
execute if score #youtuber skinwalker.temp matches 5 run team modify YouTuber suffix " [Waya]"
execute if score #youtuber skinwalker.temp matches 6 run team modify YouTuber suffix " [Lucas]"
execute if score #youtuber skinwalker.temp matches 7 run team modify YouTuber suffix " [Babi]"
