extends Button
var buttonDown = false
var cupOnPlate = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if buttonDown == true and $/root/WorldRoot/pop_machine/cup.onPlate == true:
		$/root/WorldRoot/pop_machine/cup/soda_bar.value+=delta*100
		print($/root/WorldRoot/pop_machine/cup/soda_bar.value)
		$/root/WorldRoot/pop_machine/cup/water_bar.visible = false


func _on_pressed():
	print("yoooooooo")
	


func _on_button_down():
	buttonDown = true
	


func _on_button_up():
	buttonDown = false


func _on_plate_for_cup_mouse_entered():
	pass
