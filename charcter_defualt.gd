extends CharacterBody2D
var switch = 1
var dead = false
const SPEED = 300.0
const JUMP_VELOCITY = -350.0
var Jumped = false
var Double_jump = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump 2") and is_on_floor():
		velocity.y = JUMP_VELOCITY - 50
		Jumped = true
		Double_jump = true
		print(Jumped)
	if  Jumped and Double_jump and not is_on_floor():
		Timer
		velocity.y = JUMP_VELOCITY + 0
		print(Jumped)
		Jumped = false
		velocity.y = JUMP_VELOCITY + 100
		Double_jump = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction2 := Input.get_axis("ui_left", "ui_right")
	
	if direction2:
		velocity.x = direction2 * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if dead:
		get_tree().reload_current_scene()
	


func _on_area_2d_2_body_entered(body: Area2D) -> void:
	get_tree().reload_current_scene()
