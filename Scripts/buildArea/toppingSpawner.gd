extends Node2D

@export var topping: PackedScene

var canSpawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0:
		spawn_item()


func spawn_item():
	var newTopping = topping.instantiate()
	self.add_child(newTopping)
	newTopping.global_position = self.global_position
	
