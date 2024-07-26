extends CharacterBody2D

var health = 3
@export var animated_sprite: AnimatedSprite2D

@onready var player = get_node("../player") 

func _ready():
	add_to_group("enemy")
	animated_sprite = $AnimatedSprite2D
	

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	
	velocity = direction * 100
	move_and_slide()
	
	if velocity.length() > 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
func take_damage():
	health -= 1
	
	if health == 0:
		
		animated_sprite.play("death")
		queue_free()
