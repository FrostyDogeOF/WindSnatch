extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Settings Menu"):
		visible = true
	$AudioStreamPlayer2D.play()

func _on_close_requested() -> void:
	visible = false
