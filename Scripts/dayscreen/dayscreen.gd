extends Control

var daycount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var day = $Daynum
	day.text = str(daycount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	daycount+=1
	get_tree().change_scene_to_file("res://Scenes/world_root.tscn")
