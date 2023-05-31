extends KinematicBody

export var speed = 20
export var fall_acceleration = 75

var velocity = Vector3.ZERO
onready var anim = $"3DGodotRobot/AnimationPlayer"


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
		anim.play("Run-loop")
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		anim
	if Input.is_action_pressed("move_back"):
		direction.z += 1
		anim
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		anim
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Scenes/Menu.tscn")
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
	else:
		anim.stop()
	
	

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)

func _on_SpeedPotion_potionCollected():
	speed = speed + 50
	print(speed)
	yield(get_tree().create_timer(3), "timeout")
	speed = speed - 65
	print(speed)
	yield(get_tree().create_timer(1), "timeout")
	speed = speed + 10

