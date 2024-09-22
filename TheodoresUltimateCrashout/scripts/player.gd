extends CharacterBody2D


const SPEED = 30000.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var is_attacking = false;

func _physics_process(delta: float) -> void:
	if is_attacking:
		animated_sprite_2d.play("attack")
		return
	var horizontal_axis = Input.get_axis("left", "right")
	var vertical_axis = Input.get_axis("forward", "down") 
	var direction = Vector2(horizontal_axis, vertical_axis)
	if Input.is_action_just_pressed("attack"):
		is_attacking = true;
		$Timer.start()
	else:
			 # Using 'await' to play animation fully
		if direction != Vector2.ZERO:
			direction = direction.normalized()
		velocity = direction*SPEED*delta
		if(velocity < Vector2(0, 0)):
			animated_sprite_2d.flip_h = true;
			animated_sprite_2d.play("walk")
		elif(velocity > Vector2(0, 0)):
			animated_sprite_2d.flip_h = false;
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")
	move_and_slide()
	
	


func _on_timer_timeout() -> void:
	is_attacking = false; 
