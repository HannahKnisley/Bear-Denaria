extends Area2D

var myCup

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func fillCup():
	while myCup.get_child(1).value < 100:
		await get_tree().create_timer(0.01).timeout
		myCup.get_child(1).value += 1
	myCup.canHold = true
	myCup.full = true

func _on_child_entered_tree(node):
	if node.is_in_group("cup"):
		myCup = node
		fillCup()
		
		$sodafill.play()
