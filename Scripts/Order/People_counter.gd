extends Node2D

const PEOPLE_COUNTER : String = "People_counter"


func get_people_counter() -> Node2D:
	return get_tree().get_first_node_in_group(PEOPLE_COUNTER)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
