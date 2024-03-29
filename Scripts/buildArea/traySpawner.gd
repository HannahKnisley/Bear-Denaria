extends Node2D

@export var tray: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0:
		var newTray = tray.instantiate()
		self.add_child(newTray)
		newTray.global_position = self.global_position



	
