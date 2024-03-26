extends Area2D

var toppingIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

'''
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and !sliding:
		if toppingIn:
			myPatty.reparent(self)
			myPatty.setSnap(self.global_position)
			myPatty.sliding = true
			sliding = true
'''
