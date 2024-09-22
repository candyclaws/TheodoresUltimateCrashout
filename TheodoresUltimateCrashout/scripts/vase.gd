extends RigidBody2D


# Called when the node enters the scene tree for the first time.
var initial_velocity = 5000
var target_velocity = 0.0
var slowdown = 0.05
func _ready() -> void:
	linear_velocity.x = initial_velocity # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity.x = lerp(linear_velocity.x, target_velocity, slowdown)
func got_hit(z: float):
	pass
