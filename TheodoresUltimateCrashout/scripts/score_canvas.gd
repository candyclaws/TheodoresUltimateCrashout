extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score.visible = true  # Start off hidden
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateScore()


func updateScore():
	$score.text = "Score: " + str(Gamestate.damage_caused)
