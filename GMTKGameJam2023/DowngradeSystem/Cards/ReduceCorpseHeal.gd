extends Node

func apply_downgrade():
	PlayerStats.health_gain_per_corpse /= 2
	PlayerStats.update_player_stats()
