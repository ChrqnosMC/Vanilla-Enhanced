schedule function vanilla_enhanced:second 1s

scoreboard players add @a afk.checkAFK 1

execute as @a[scores={afk.checkAFK=150..}] at @s run function vanilla_enhanced:check_afk
execute as @a[team=afk] at @s run function vanilla_enhanced:remove_afk