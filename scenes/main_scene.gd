extends Node2D

func spawn_enemy():
	var new_enemy = preload("res://scenes/enemy.tscn").instantiate()
	var path_follow = $player/spawn/PathFollow2D
	if path_follow:
		path_follow.progress_ratio = randf()
		new_enemy.global_position = path_follow.global_position
		add_child(new_enemy)
	else:
		print("Node not found: %spawn/PathFollow2D")


func _on_timer_timeout():
	spawn_enemy()


func _on_player_health_depleted():
	%gameOver.visible = true
	get_tree().paused = true
