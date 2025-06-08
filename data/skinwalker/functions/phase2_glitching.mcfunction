# Phase 2: YouTubers start glitching and disappearing

# Set phase
scoreboard players set #phase skinwalker.phase 2

# Initial announcement
title @a title ["",{"text":"Something's Wrong...","color":"dark_red"}]
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5

# Schedule YouTuber disappearances
schedule function skinwalker:youtubers/disappear/dream 5s
schedule function skinwalker:youtubers/disappear/mrbeast 15s
schedule function skinwalker:youtubers/disappear/technoblade 25s
schedule function skinwalker:youtubers/disappear/craftee 35s
schedule function skinwalker:youtubers/disappear/preston 45s

# Schedule phase 3
schedule function skinwalker:phase3_reveal 60s
