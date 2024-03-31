extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Daynum.text = str(Globals.dayCount)

	Globals.numOrders = 0
	Globals.numCustomers = 0
	Globals.customersServed = 0

	Globals.lastBun = "top"

	Globals.readyForTicket = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/world_root.tscn")
