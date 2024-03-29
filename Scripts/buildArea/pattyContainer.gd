extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $curPatty.get_child_count() == 0 and self.get_child_count() > 1:
		self.get_child(1).reparent($curPatty)
		$curPatty.get_child(0).setSnap($curPatty.global_position)
		$curPatty.get_child(0).visible = true


func _on_child_entered_tree(node):
	if node.is_in_group("patty"):
		node.visible = false
		node.sliding = false
		node.sendToBuild()
		node.setSnap(self.global_position)


		
