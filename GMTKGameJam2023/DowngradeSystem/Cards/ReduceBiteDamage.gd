extends Node

func apply_downgrade():
	PlayerStats.bite_damage -= 1
	PlayerStats.update_player_stats()
