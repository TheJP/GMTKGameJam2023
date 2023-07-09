extends Node

func apply_downgrade():
	PlayerStats.bite_range -= 50
	PlayerStats.update_player_stats()
