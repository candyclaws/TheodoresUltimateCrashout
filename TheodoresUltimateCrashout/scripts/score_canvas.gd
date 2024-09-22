extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score.visible = false  # Start off hidden
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateScore()
	add_to_scene()
func add_to_scene():
	var curr_scene = get_tree().current_scene
	if "cutscene" not in curr_scene.name:
		$score.visible = true
func updateScore():
	$score.text = "Score: " + str(Gamestate.damage_caused)
