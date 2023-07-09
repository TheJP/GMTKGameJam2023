extends Node

func apply_downgrade():
	PlayerStats.scariness -= 1
	PlayerStats.update_player_stats()

