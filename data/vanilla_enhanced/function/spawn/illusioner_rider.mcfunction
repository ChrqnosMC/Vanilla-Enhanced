summon ravager ~ ~ ~ {CanJoinRaid:1b,Tags:["raiders_check","illusioner_rider"],Passengers:[{id:"minecraft:illusioner",CanJoinRaid:1b,Tags:["raiders_check"],HandItems:[{id:"minecraft:bow",count:1},{}]}]}
data modify entity @e[type=ravager,tag=illusioner_rider,sort=nearest,limit=1] Wave set from entity @e[type=ravager,tag=!illusioner_rider,limit=1,sort=nearest]
execute as @e[type=illusioner,tag=raiders_check,sort=nearest,limit=1] at @s run function vanilla_enhanced:spawn/set_illusioner
tag @e[type=ravager,tag=illusioner_rider,limit=1,sort=nearest] remove illusioner_rider