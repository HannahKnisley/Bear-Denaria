extends Button
var buttonDown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if buttonDown == true and $/root/WorldRoot/pop_machine/cup.onPlate2 == true and $/root/WorldRoot/pop_machine/cup.onPlate == false and $/root/WorldRoot/pop_machine/cup.countOnPlate1 == 1:
		$/root/WorldRoot/pop_machine/cup/water_bar.value+=delta*100
		$/root/WorldRoot/pop_machine/cup/soda_bar.visible = false
		print($/root/WorldRoot/pop_machine/cup/water_bar.value)


func _on_button_up():
	buttonDown = false


func _on_button_down():
	buttonDown = true
