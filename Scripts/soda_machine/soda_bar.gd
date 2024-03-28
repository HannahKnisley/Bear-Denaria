extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $/root/pop_machine/cup/soda_bar.value == 1:
		$/root/pop_machine/cup/soda_bar.visible = false
	else:
		$/root/pop_machine/cup/soda_bar.visible = true
	if $/root/pop_machine/cup/water_bar.value == 1:
		$/root/pop_machine/cup/water_bar.visible = false
	else:
		$/root/pop_machine/cup/water_bar.visible = true
