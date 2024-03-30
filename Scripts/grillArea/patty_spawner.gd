extends Node2D

@export var patty: PackedScene

var canSpawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0 and self.get_parent().visible == true:
		spawn_patty()
			
	if self.get_parent().visible == false:
		for child in self.get_children():
			child.queue_free()


func spawn_patty():
	var newPatty = patty.instantiate()
	self.add_child(newPatty)
	newPatty.global_position = self.global_position
	

