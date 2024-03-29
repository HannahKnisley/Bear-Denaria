extends Area2D

var myCup

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	


func _on_child_entered_tree(node):
	if node.is_in_group("cup"):
		myCup = node
