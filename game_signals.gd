extends Node

# For any damage coming from bosses
signal do_damage_to_player(damageValue:int)

# For any damage coming from player
signal take_damage_from_player(damageValue:int)
