extends CharacterBody2D


const SPEED = 10000.0
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var horizontal_axis = Input.get_axis("left", "right")
	var vertical_axis = Input.get_axis("forward", "down") 
	var direction = Vector2(horizontal_axis, vertical_axis)
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
			
	print(direction)
	move_and_slide()
