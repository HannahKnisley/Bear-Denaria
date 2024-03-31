extends Node2D

var maxSteps = 275
var count = 0
var step = 2.75


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func doStep():
	if count<maxSteps:
		$guy.global_position.x -= step
		count += step
		
func reset():
	$guy.global_position.y += count
	count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
