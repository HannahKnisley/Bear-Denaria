extends Node2D

@export var topping: PackedScene

var canSpawn = false
var buttonPressed = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0 and self.get_parent().visible == true and Globals.budget>=3:
		spawn_item()
	if self.get_parent().visible == false or Globals.budget<2:
		for child in self.get_children():
			child.queue_free()


func spawn_item():
	var newTopping = topping.instantiate()
	self.add_child(newTopping)
	newTopping.global_position = self.global_position
	
	if buttonPressed == false:
		Globals.budget -= 3
	else:
		buttonPressed = false
