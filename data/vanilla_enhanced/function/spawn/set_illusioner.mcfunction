execute if predicate vanilla_enhanced:chance_30 run enchant @s power 1
execute if predicate vanilla_enhanced:chance_20 run enchant @s power 2
execute if predicate vanilla_enhanced:chance_20 run enchant @s punch 1
execute if predicate vanilla_enhanced:chance_5 run enchant @s infinity
data modify entity @s Wave set from entity @e[type=#raiders,sort=nearest,limit=1] Wave
data modify entity @s PersistenceRequired set from entity @e[type=#raiders,sort=nearest,limit=1] PersistenceRequired
execute if predicate vanilla_enhanced:chance_10 run execute if entity @e[type=#raiders,nbt={PatrolLeader:1b}] run function vanilla_enhanced:spawn/illusioner_promote