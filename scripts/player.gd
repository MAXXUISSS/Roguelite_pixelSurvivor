extends CharacterBody2D
var health = 100.0
signal health_depleted
@export var animation_player: AnimatedSprite2D

func _ready():
	animation_player = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 200
	move_and_slide()
	if direction.x == 1:
		animation_player.play("walk")
		animation_player.flip_h = false
	elif direction.x == -1:
		animation_player.play("walk")
		animation_player.flip_h = true
	elif direction.y == 1:
		animation_player.play("walk")
	elif direction.y == -1:
		animation_player.play("walk")
	elif direction.x == -1:
		animation_player.play("walk")
	elif direction.x == 0 and direction.y == 0:
		animation_player.play("idle")
		
		
	const DAMAGE_RATE = 50.0
	var overlapping_mobs = %hurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$ProgressBar.value = health
		print(health)
		if health <= 0.0 :
			health_depleted.emit()


