extends Node2D

var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseIn:
		$button/buttonUp.visible = false
		$button/buttonDown.visible = true

			
		$lid.visible = true
		if $goodToppings.visible == true:
			$goodToppings.visible = false
			$trashToppings.visible = true
		else:
			$trashToppings.visible = false
			$goodToppings.visible = true
		await get_tree().create_timer(1).timeout
		$lid.visible = false
	if Input.is_action_just_released("mouseClick"):
		$button/buttonUp.visible = true
		$button/buttonDown.visible = false

func _on_button_mouse_entered():
	mouseIn = true


func _on_button_mouse_exited():
	mouseIn = false
