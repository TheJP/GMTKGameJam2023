extends Node

func apply_downgrade():
	PlayerStats.claw_range -= 25
	PlayerStats.update_player_stats()
