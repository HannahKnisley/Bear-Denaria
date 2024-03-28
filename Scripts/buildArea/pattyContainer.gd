extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_child_entered_tree(node):
	if self.get_child_count() > 0:
		self.get_child(0).visible = false
	node.sliding = false
	node.sendToBuild()
	node.setSnap(self.global_position)
	await get_tree().create_timer(0.1).timeout
	node.visible = false
	self.get_child(0).visible = true


func _on_child_exiting_tree(node):
	if self.get_child_count() > 0:
		self.get_child(0).visible = true


func _on_build_area_body_entered(body):
	pass # Replace with function body.






