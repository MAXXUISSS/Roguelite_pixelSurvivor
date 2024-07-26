extends Area2D

@onready var shooting_point = $weaponPivot/Gun/shootingPoint

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = shooting_point.global_position
	new_bullet.rotation = shooting_point.global_rotation
	get_tree().root.add_child(new_bullet)


func _on_timer_timeout():
	shoot()


