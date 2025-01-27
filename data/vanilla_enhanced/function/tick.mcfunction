scoreboard players enable @a afk
execute as @a[scores={afk=1..}] run function vanilla_enhanced:trigger_afk

execute as @a at @s run function vanilla_enhanced:connected_world

execute as @e[type=#raiders,tag=!raiders_check,limit=1,predicate=vanilla_enhanced:chance_5,nbt=!{Wave:0},nbt=!{Wave:3},nbt=!{Wave:4},nbt=!{Wave:5},nbt=!{Wave:6},nbt=!{Wave:7},nbt=!{Wave:8}] at @s run function vanilla_enhanced:spawn/illusioner
execute as @e[type=#raiders,tag=!raiders_check,limit=2,predicate=vanilla_enhanced:chance_5,nbt=!{Wave:0},nbt=!{Wave:1},nbt=!{Wave:2},nbt=!{Wave:6},nbt=!{Wave:7},nbt=!{Wave:8}] at @s run function vanilla_enhanced:spawn/illusioner
execute as @e[type=#raiders,tag=!raiders_check,limit=3,predicate=vanilla_enhanced:chance_10,nbt=!{Wave:0},nbt=!{Wave:1},nbt=!{Wave:2},nbt=!{Wave:3},nbt=!{Wave:4},nbt=!{Wave:5}] at @s run function vanilla_enhanced:spawn/illusioner
execute as @e[type=#raiders,tag=!raiders_check,limit=1,predicate=vanilla_enhanced:chance_5,nbt=!{Wave:0},nbt=!{Wave:1},nbt=!{Wave:2},nbt=!{Wave:3},nbt=!{Wave:4}] at @s run function vanilla_enhanced:spawn/illusioner_rider

tag @e[type=#raiders,tag=!raiders_check] add raiders_check

execute as @a[advancements={vanilla_enhanced:enter_bastion_remnant_with_bad_omen=true}] at @s run function vanilla_enhanced:get_effect/get_bastion_omen
execute as @a[advancements={vanilla_enhanced:enter_end_city_with_bad_omen=true}] at @s run function vanilla_enhanced:get_effect/get_city_omen
execute as @a[advancements={vanilla_enhanced:check_sleep=true}] at @s run function vanilla_enhanced:get_effect/remove_dreaming
execute as @a[advancements={vanilla_enhanced:consume_dreaming_bottle=true}] at @s run function vanilla_enhanced:get_effect/get_dreaming