execute store result score @s afk.x2 run data get entity @s Pos[0] 100
execute store result score @s afk.y2 run data get entity @s Pos[1] 100
execute store result score @s afk.z2 run data get entity @s Pos[2] 100

execute unless score @s afk.x2 = @s afk.x1 run team leave @s
execute unless score @s afk.y2 = @s afk.y1 run team leave @s
execute unless score @s afk.z2 = @s afk.z1 run team leave @s

execute store result score @s afk.x1 run data get entity @s Pos[0] 100
execute store result score @s afk.y1 run data get entity @s Pos[1] 100
execute store result score @s afk.z1 run data get entity @s Pos[2] 100

scoreboard players set @s afk.checkAFK 0