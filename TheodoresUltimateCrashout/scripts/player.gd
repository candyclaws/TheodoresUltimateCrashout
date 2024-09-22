#extends CharacterBody2D
#
#
#const SPEED = 30000.0
#@onready var animated_sprite_2d = $AnimatedSprite2D
#var is_attacking = false;
#
#@onready var ray_cast_right: RayCast2D = $RayCastRight
#@onready var ray_cast_left: RayCast2D = $RayCastLeft
#@onready var ray_cast_down: RayCast2D = $RayCastDown
#@onready var ray_cast_up: RayCast2D = $RayCastUp
#
#
#func _physics_process(delta: float) -> void:
	#if is_attacking:
		#animated_sprite_2d.play("attack")
		#bat_collision()
		#return
	#var horizontal_axis = Input.get_axis("left", "right")
	#var vertical_axis = Input.get_axis("forward", "down") 
	#var direction = Vector2(horizontal_axis, vertical_axis)
	#if Input.is_action_just_pressed("attack"):
		#is_attacking = true;
		#$Timer.start()
	#else:
			 ## Using 'await' to play animation fully
		#if direction != Vector2.ZERO:
			#direction = direction.normalized()
		#velocity = direction*SPEED*delta
		#if(velocity < Vector2(0, 0)):
			#animated_sprite_2d.flip_h = true;
			#animated_sprite_2d.play("walking")
		#elif(velocity > Vector2(0, 0)):
			#animated_sprite_2d.flip_h = false;
			#animated_sprite_2d.play("walking")
		#else:
			#animated_sprite_2d.play("idle")
	#move_and_slide()
	#
	#
#
#
#func _on_timer_timeout() -> void:
	#is_attacking = false; 
	#
#func bat_collision():
	#if(ray_cast_right.is_colliding() && ray_cast_right.get_collider() is RigidBody2D):
		#ray_cast_right.get_collider().got_hit(1)
	#elif(ray_cast_left.is_colliding() && ray_cast_left.get_collider() is RigidBody2D):
		#ray_cast_left.get_collider().got_hit(2)
	#elif(ray_cast_up.is_colliding() && ray_cast_up.get_collider() is RigidBody2D):
		#ray_cast_up.get_collider().got_hit(3)
	#elif(ray_cast_down.is_colliding() && ray_cast_down.get_collider() is RigidBody2D):
		#ray_cast_down.get_collider().got_hit(4)

extends CharacterBody2D


const SPEED = 30000.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var is_attacking = false;



@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_up: RayCast2D = $RayCastUp


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
			animated_sprite_2d.play("walking")
		elif(velocity > Vector2(0, 0)):
			animated_sprite_2d.flip_h = false;
			animated_sprite_2d.play("walking")
		else:
			animated_sprite_2d.play("idle")
	move_and_slide()
	
	


func _on_timer_timeout() -> void:
	bat_collision()
	is_attacking = false; 
	
	
	
func bat_collision():
<<<<<<< HEAD
	if(ray_cast_right.is_colliding() && ray_cast_right.get_collider() is RigidBody2D):
		ray_cast_right.get_collider().got_hit((ray_cast_right.get_collider().position - position))
	elif(ray_cast_left.is_colliding() && ray_cast_left.get_collider() is RigidBody2D):
		ray_cast_left.get_collider().got_hit(2)
	elif(ray_cast_up.is_colliding() && ray_cast_up.get_collider() is RigidBody2D):
		ray_cast_up.get_collider().got_hit(3)
	elif(ray_cast_down.is_colliding() && ray_cast_down.get_collider() is RigidBody2D):
		ray_cast_down.get_collider().got_hit(4)
=======
	var ray_casts = [ray_cast_right, ray_cast_left, ray_cast_up, ray_cast_down]
	for i in ray_casts:
		if i.is_colliding():
			var object = i.get_collider()
			if object is RigidBody2D:
				object.got_hit(position.direction_to(object.position))
				
				
#	if(ray_cast_right.is_colliding() && ray_cast_right.get_collider() is RigidBody2D):
#		ray_cast_right.get_collider().got_hit(1)
#	elif(ray_cast_left.is_colliding() && ray_cast_left.get_collider() is RigidBody2D):
#		ray_cast_left.get_collider().got_hit(2)
#	elif(ray_cast_up.is_colliding() && ray_cast_up.get_collider() is RigidBody2D):
#		ray_cast_up.get_collider().got_hit(3)
#	elif(ray_cast_down.is_colliding() && ray_cast_down.get_collider() is RigidBody2D):
#		ray_cast_down.get_collider().got_hit(4)
>>>>>>> refs/remotes/origin/main
	
