extends Area2D

@export var ticket: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("up")
	if body.is_in_group("ticket"):
		print("yupppp")


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var name_of_customer = get_node("/root/Globals")
	name_of_customer.ticket_move = true
	var num = 0
	print(area_rid)
	
		
