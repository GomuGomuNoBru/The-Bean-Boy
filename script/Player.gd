#Player
extends KinematicBody

#variables
export var speed = 20
export var rotateSpeed = 5
export var fall_acceleration = 75


var velocity = Vector3.ZERO

onready var anim = $"3DGodotRobot/AnimationPlayer"
onready var playerModel = $PlayerModel
onready var Gun = $Gun
onready var AimCast = $AimCast
onready var gun_controller = $GunController

#add Player to group "Player"
func _ready():
	add_to_group("Player")


#movment, camera, gravity, shooting
func _physics_process(delta):
	var direction = Vector3()
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		anim.play("Run-loop")
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		anim.play("Run-loop")
	if Input.is_action_pressed("move_back"):
		direction.z += 1
		anim.play("Run-loop")
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		anim.play("Run-loop")
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://Scenes/Menu.tscn")
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		var targetRotation = direction.angle_to(Vector3.FORWARD)
		rotation.y = lerp_angle(rotation.y, targetRotation, rotateSpeed * delta)
		if str(get_tree().current_scene.name) != "Survive":
			$hand.look_at(translation + direction, Vector3.UP)
	else:
		anim.play("Idle-loop")
	
	if str(get_tree().current_scene.name) == "Survive":
		shooting()

	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)


#when signal is receive it speed player for 3 secs, then goes back to normal
func _on_SpeedPotion_potionCollected():
	speed = speed + 50
	print(speed)
	yield(get_tree().create_timer(3), "timeout")
	speed = speed - 65
	print(speed)
	yield(get_tree().create_timer(1), "timeout")
	speed = speed + 10

#shooting
func shooting():
	if Input.is_action_pressed("left_click"):
		gun_controller.shoot()
	


