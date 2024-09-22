@tool
extends RigidBody2D

class_name physics_object

@export var price : int
@export var health : int

@onready var image = $image
var y_offset_val = 0



func _process(delta):
	image.global_position = global_position - Vector2(0, y_offset_val)
	image.rotation = rotation
	image.get_child(0).global_position = image.global_position
	pass

func got_hit(z: Vector2):
	#making tween for y offset
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
#	tween.tween_property(image, "global_position:y", nextpos, 0.3)
	tween.tween_method(y_offset, 0, 100, 0.3)
	tween.tween_callback(y_back_down)
	
	# Doing the physics + cash
	var initial_velocity = 3000;
	linear_velocity = z * initial_velocity
	health -= 1
	Gamestate.damage_caused += price / health / 2
	if health <= 0:
		Gamestate.damage_caused3 += price / 2
		var children = get_children()
		for child in children:
			child.free()
		queue_free()

func y_back_down():
	var tween2 = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_BOUNCE)
	var nextpos = image.global_position.y + 100
#	tween2.tween_property(image, "global_position:y", nextpos, 1.0)
	tween2.tween_method(y_offset, 100, 0, 0.3)

func y_offset(y):
	y_offset_val = y
	#$image.global_position.y = global_position.y - y
	#$image.global_position.x = global_position.x
	
