extends Node2D
var counterr = false
var nameOptions = ["bob", "joe", "Ella", "Erin", "Haley", "Hannah"]
var myName
var order

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	myName = nameOptions[rng.randi_range(0,5)]
	print(myName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var name_of_customer = get_node("/root/Globals")
	name_of_customer.customertype = "nice"
	if counterr == false:
		translate(Vector2(-delta*55, 0))
		


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("counter") or area.is_in_group("customer"):
		counterr=true
	if area.is_in_group("counter"):
		Globals.firstCustomer = self
		Globals.customerAtCounter = true
		
func orderTaken():
	Globals.customerAtCounter = false


