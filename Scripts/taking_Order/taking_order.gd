extends Node2D
var dragging = false 
var of = Vector2(0,0)
var mouseEnerted = false
@export var ticket: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var name_of_customer = get_node("/root/Globals")
	
	$/root/WorldRoot/taking_an_order/name.text = str(name_of_customer.name_of_customer)
	var mob = ticket.instantiate()
	
	add_child(mob)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

