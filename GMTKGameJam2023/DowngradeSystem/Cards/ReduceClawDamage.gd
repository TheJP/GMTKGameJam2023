extends Node

func apply_downgrade():
	PlayerStats.claw_damage /= 2
	PlayerStats.update_player_stats()
