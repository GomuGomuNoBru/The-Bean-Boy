extends Label

var time_elapsed := 0.0


func _ready():
	text = String(time_elapsed)


func _process(delta: float) -> void:
	time_elapsed += delta
	
















#var time := 0

#onready var countdown := $Timer

#func _process(_delta : float) -> void:
#	text = _format_seconds(countdown.time_left,9)
#
#
#
#func _format_seconds(time : float, use_milliseconds : bool) -> String:
#	var minutes := time / 60
#	var seconds := fmod(time, 60)
#	if not use_milliseconds:
#		return "%02d:%02d" % [minutes, seconds]
#	var milliseconds := fmod(time, 1) * 100
#	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
#
#
#
