extends Node

func apply_downgrade():
	PlayerStats.bite_damage /= 2
	PlayerStats.update_player_stats()
