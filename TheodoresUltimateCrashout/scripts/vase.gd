extends RigidBody2D


# Called when the node enters the scene tree for the first time.
var initial_velocity = 0;
var target_velocity = 0.0
var slowdown = 0.05
var x = -1;
func _ready() -> void:
	linear_velocity.x = initial_velocity # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var factor = 1;
	if(linear_velocity.x < 0 || linear_velocity.y < 0):
		factor = -1
	if(x == -1):
		return
	else:
		if(x <= 2):
			linear_velocity.x = lerp(linear_velocity.x, target_velocity, slowdown*factor)
		else:
			linear_velocity.y = lerp(linear_velocity.y, target_velocity, slowdown*factor)
func got_hit(z: float):
	initial_velocity = 3000;
	x= z;
	if(z == 1):
		linear_velocity.x = initial_velocity
	elif(z==2):
		linear_velocity.x = -initial_velocity
	elif(z == 3):
		linear_velocity.y = -initial_velocity
	elif(z==4):
		linear_velocity.y =  initial_velocity
		
