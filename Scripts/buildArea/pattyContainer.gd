extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_child_entered_tree(node):
	node.sliding = false
	node.sendToBuild()
	node.setSnap(self.global_position)
	await get_tree().create_timer(0.1).timeout
	node.visible = false
