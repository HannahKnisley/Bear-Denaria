extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var name_of_customer = get_node("/root/Globals")


	
	$/root/taking_Order/name.text = str(name_of_customer.name_of_customer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
