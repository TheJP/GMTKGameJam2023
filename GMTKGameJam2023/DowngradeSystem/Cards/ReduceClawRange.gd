extends Node

func apply_downgrade():
	PlayerStats.claw_range -= 100
	PlayerStats.update_player_stats()
