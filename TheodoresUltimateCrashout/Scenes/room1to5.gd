extends Area2D
class_name room_portal

@export var nextroom := "res://Scenes/Room5.tscn"
var entered = false

func _on_body_entered(body: PhysicsBody2D):
	if body.name == "player":
		entered = true


func _on_body_exited(body):
	if body.name == "player":
		entered = false


func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			print("Sending you to room: ", nextroom)
			entered = false
			get_tree().change_scene_to_file(nextroom)
			
		
