extends Area2D

var mouseEnerted = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mouseClick") and mouseEnerted and $/root/WorldRoot/pop_machine/cup.onPlate == true and $/root/WorldRoot/pop_machine/cup.onPlate2 == false and $/root/WorldRoot/pop_machine/cup.countOnPlate1 == 1:
		$/root/WorldRoot/pop_machine/cup/soda_bar.value+=delta*100
		print($/root/WorldRoot/pop_machine/cup/soda_bar.value)
		$/root/WorldRoot/pop_machine/cup/water_bar.visible = false



func _on_mouse_entered():
	mouseEnerted = true


func _on_mouse_exited():
	mouseEnerted = false
