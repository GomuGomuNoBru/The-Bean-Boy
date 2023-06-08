# class for bullet
extends Spatial
#speed of bullet
export var speed = 70
#dmg of bullet
export var dmg = 1

#how long it will stay
const ITS_THE_FINAL_COUNTDOWN = 5
var timer = 0

#physics process in game
func _physics_process(delta):
	var foward_direction = global_transform.basis.z.normalized()
	global_translate(foward_direction * speed * delta)
	
	timer += delta
	if timer >= ITS_THE_FINAL_COUNTDOWN:
		queue_free()

#bullets touches enemy and takes it "stats" node to hit it
func _on_Area_body_entered(body: Node):
	queue_free()
	
	if body.has_node("Stats"):
		var stats_node = body.find_node("Stats") as Stats
		stats_node.take_hit(dmg)
