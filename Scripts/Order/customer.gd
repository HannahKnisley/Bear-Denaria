extends Node2D
var counterr = false
var nameOptions = ["bob", "joe", "Ella", "Erin", "Haley", "Hannah"]
var myName
var hasOrdered = false

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	myName = nameOptions[rng.randi_range(0,5)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counterr == false:
		translate(Vector2(-delta*55, 0))
		
func orderTaken():
	self.global_position = $/root/WorldRoot/Order_screen/waitLine.global_position
	hasOrdered = true
	Globals.customerAtCounter = false

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("counter") or area.is_in_group("customer"):
		counterr=true
	if area.is_in_group("counter") and !hasOrdered:
		Globals.firstCustomer = self
		Globals.customerAtCounter = true
		

func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("counter") or area.is_in_group("customer"):
		counterr=false
