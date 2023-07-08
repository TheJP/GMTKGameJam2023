extends Node

func apply_downgrade():
	PlayerStats.movement_speed -= 100
	PlayerStats.update_player_stats()
