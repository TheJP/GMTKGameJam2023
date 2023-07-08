extends Node

func apply_downgrade():
	PlayerStats.claw_attack_speed += 1
	PlayerStats.update_player_stats()
