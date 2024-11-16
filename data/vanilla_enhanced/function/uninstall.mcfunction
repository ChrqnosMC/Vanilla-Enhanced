schedule clear vanilla_enhanced:second

scoreboard objectives remove afk.x1
scoreboard objectives remove afk.x2
scoreboard objectives remove afk.y1
scoreboard objectives remove afk.y2
scoreboard objectives remove afk.z1
scoreboard objectives remove afk.z2
scoreboard objectives remove afk.checkAFK
scoreboard objectives remove afk
team remove afk

schedule clear vanilla_enhanced:tick

scoreboard objectives remove Health

tellraw @a ["",{"text":"Vanilla Enhanced datapack has been uninstall"}]