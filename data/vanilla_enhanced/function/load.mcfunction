scoreboard objectives add afk.x1 dummy
scoreboard objectives add afk.x2 dummy
scoreboard objectives add afk.y1 dummy
scoreboard objectives add afk.y2 dummy
scoreboard objectives add afk.z1 dummy
scoreboard objectives add afk.z2 dummy
scoreboard objectives add afk.checkAFK dummy
scoreboard objectives add afk trigger

team add afk "AFK Display"
team modify afk color white
team modify afk suffix {"text":" [AFK]", "color":"white"}

scoreboard objectives add Health health
scoreboard objectives setdisplay list Health
scoreboard objectives setdisplay below_name Health

scoreboard objectives add live trigger
team add live "Streamer Trigger"
team modify live color white
team modify live suffix {"text":" [LIVE]", "color":"white"}

tellraw @a ["",{"text":"Vanilla Enhanced datapack has been reloaded"}]