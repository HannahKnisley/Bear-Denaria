extends Node2D
var dragging = false 
var of = Vector2(0,0)
var mouseEnerted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var name_of_customer = get_node("/root/Globals")


	
	$/root/taking_an_order/name.text = str(name_of_customer.name_of_customer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_global_mouse_position()
	

func _on_button_button_down():
	dragging = true
	print("hshhhh")


func _on_button_button_up():
	dragging=false


func _on_ticket_mouse_entered():
	mouseEnerted = true
