extends Node

func apply_downgrade():
	PlayerStats.claw_damage -= 1
	PlayerStats.update_player_stats()
