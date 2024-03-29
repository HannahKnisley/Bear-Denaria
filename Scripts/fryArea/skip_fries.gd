extends Area2D

var myTray
var mouseCollide = false

@export var noFry: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	myTray = get_node("../curTray")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseCollide:
		if myTray.get_child_count() > 0:
			var noFries = noFry.instantiate()
			myTray.get_child(0).add_child(noFries)
			


func _on_mouse_entered():
	mouseCollide = true


func _on_mouse_exited():
	mouseCollide = false
