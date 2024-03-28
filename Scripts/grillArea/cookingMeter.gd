extends Node2D

var maxSteps = 75
var count = 0
var step = 0.75


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func doStep():
	if count<maxSteps:
		$guy.global_position.y -= step
		count += step

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass