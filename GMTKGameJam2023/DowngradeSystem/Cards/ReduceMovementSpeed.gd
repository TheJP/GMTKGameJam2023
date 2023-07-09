extends Node

func apply_downgrade():
	PlayerStats.movement_speed -= 300
	PlayerStats.update_player_stats()
