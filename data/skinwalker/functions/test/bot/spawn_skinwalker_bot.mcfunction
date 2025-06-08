# skinwalker:test/bot/spawn_skinwalker_bot
# Summons and configures the Bot Skinwalker.

# Summon an armor stand named "Bot Skinwalker"
summon armor_stand ~ ~ ~ {CustomName:'{"text":"Bot Skinwalker"}', CustomNameVisible:1b, Invulnerable:1b, NoGravity:1b, Tags:["bot_skinwalker_entity"]}

# Give it a player head for visual indication (Steve head by default)
# You can replace "PlayerName" with a specific player's name for a different head.
# Or use a custom head NBT if you have one.
item replace entity @e[type=armor_stand,name="Bot Skinwalker",tag=bot_skinwalker_entity,limit=1] armor.head with minecraft:player_head{SkullOwner:"Steve"} 1

# Apply Skinwalker role and team
tag @e[type=armor_stand,name="Bot Skinwalker",tag=bot_skinwalker_entity,limit=1] add skinwalker
tag @e[type=armor_stand,name="Bot Skinwalker",tag=bot_skinwalker_entity,limit=1] add bot_skinwalker # Generic bot tag
team join Skinwalkers @e[type=armor_stand,name="Bot Skinwalker",tag=bot_skinwalker_entity,limit=1]

# Announce its arrival
tellraw @a ["",{"text":"[","color":"dark_red"},{"text":"BOT","color":"red"},{"text":"] ","color":"dark_red"},{"text":"A ","color":"gray"},{"text":"Bot Skinwalker","color":"red"},{"text":" has spawned to hunt you down!","color":"gray"}]
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 0.8
