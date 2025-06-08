# Event: RUN.
title @a title {"text":"RUN.","color":"red","bold":true}
title @a subtitle {"text":"He’s becoming all of us...","color":"dark_gray","italic":true}
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
# Schedule glitch sound slightly after to prevent overlap if too intense
schedule function skinwalker:events/warnings/run_glitch_sound 10t
