extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.global_position = $/root/WorldRoot/taking_an_order.global_position + Vector2(500,350)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
