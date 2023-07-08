extends Node

func apply_downgrade():
	PlayerStats.bite_range -= 25
	PlayerStats.update_player_stats()
