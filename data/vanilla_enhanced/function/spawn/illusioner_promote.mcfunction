data modify entity @s ArmorItems set from entity @e[type=#raiders,limit=1,sort=nearest,nbt={PatrolLeader:1b}] ArmorItems
data merge entity @s {CanJoinRaid: 1b, PatrolLeader: 1b, Patrolling: 0b, ArmorDropChances: [0.085f, 0.085f, 0.085f, 2.0f], CanPickUpLoot: 0b}