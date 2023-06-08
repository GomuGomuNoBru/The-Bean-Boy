#boxes
extends RigidBody

#circle
const CIRCLE = 2 * PI
#speed of rotation
const SPEEDROTATEMAX = 10
#signal
signal hit_by_block(body_name_p)

#box "color"
var my_spatial_material = SpatialMaterial.new()
#player
var player = player
#gravity
var gravity = 1.0
#timer
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var my_mesh = MeshInstance.new()
	my_mesh.name = "MeshInstance"
#	my_mesh.mesh = CubeMesh.new()
	var my_cube_mesh = CubeMesh.new()
#	my_cube_mesh.name = "CubeMesh"
	my_mesh.mesh =  my_cube_mesh
#	var my_spatial_material = SpatialMaterial.new()
	my_cube_mesh.material = my_spatial_material
	add_child(my_mesh)
	var my_collision = CollisionShape.new()
	my_collision.shape = BoxShape.new()
	my_collision.set_disabled(true)
	add_child(my_collision)
	var my_area = Area.new()
	var my_area_collsion = CollisionShape.new()
	my_area_collsion.shape = BoxShape.new()
	my_area.connect("body_entered",self,"_on_Area_body_entered")
	my_area.connect("hit", LivesCount, "_on_hit")
	add_child(my_area)
	reset_position()
	reset_velocity()
	reset_rotation()
	reset_color()
	my_area.add_child(my_area_collsion)
	 # Create a new Timer instance
	timer = Timer.new()
	# Set the wait time to 25 seconds
	timer.wait_time = 25
	# Connect the timer's "timeout" signal to the script's "_on_Timer_timeout" method
	timer.connect("timeout", self, "_on_Timer_timeout")
	# Add the timer to the scene
	add_child(timer)
	# Start the timer
	timer.start()
	

#reset position of blocks 
func reset_position():
	translation.y = 20
	translation.x = randf() * 60 - 30
	translation.z = randf() * 60 - 30

#reset falling velocity
func reset_velocity():
	linear_velocity = Vector3(0,0,0)
	angular_velocity = Vector3(randf() * SPEEDROTATEMAX, randf() * SPEEDROTATEMAX, randf() * SPEEDROTATEMAX)

#reset rotation
func reset_rotation():
	rotation = Vector3(randf() * CIRCLE, randf() * CIRCLE, randf() * CIRCLE)
	
#reset color of blocks
func reset_color():
	my_spatial_material.albedo_color = Color(randf(), randf(), randf(), 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if translation.y < -5:
		reset_position()
		reset_velocity()
		reset_rotation()

#if players touches box send signal hit with body name
func _on_Area_body_entered(body):
	if body.name == "Player" || "BeanBoy":
		var name = body.name
		emit_signal("hit", name)

#gravity goues up, yupi
func _on_Timer_timeout():
	# Increment the gravity value by 1
	gravity += 1
	gravity_scale = gravity 

