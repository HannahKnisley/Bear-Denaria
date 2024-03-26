extends Area2D
var dragging = false
var of = Vector2(0,0)
var lifted = false
var mouseEnerted = false
var followMouse = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var name_of_customer = get_node("/root/Globals")
	if name_of_customer.customertype == "nice":
		name_of_customer.tomato = true
		name_of_customer.letteace = true
		name_of_customer.pickle = false
		name_of_customer.pickey = false
		name_of_customer.kitchup = true
		name_of_customer.mustard = true
		$/root/WorldRoot/taking_an_order/ticket2/ticket/tomato.visible = true
		$/root/WorldRoot/taking_an_order/ticket2/ticket/lettatcue.visible = true
		$/root/WorldRoot/taking_an_order/ticket2/ticket/piclke.visible = false
		$/root/WorldRoot/taking_an_order/ticket2/ticket/ketchup.visible = true
		$/root/WorldRoot/taking_an_order/ticket2/ticket/mustard.visible = true
		
	if Input.is_action_just_pressed("mouseClick") and mouseEnerted:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse:
		self.position = get_local_mouse_position()
		name_of_customer.ticket_move = true
	if Input.is_action_just_released("mouseClick"):
		followMouse = false
		#self.position = Vector2(0,0)
	


func _on_mouse_entered():
	mouseEnerted = true


func _on_mouse_exited():
	mouseEnerted = false
