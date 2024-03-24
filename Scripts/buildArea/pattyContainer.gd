extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_child_entered_tree(node):
	print("collected")
	node.setSnap(self.global_position)
	node.visible = false
	self.get_child(0).visible = true
