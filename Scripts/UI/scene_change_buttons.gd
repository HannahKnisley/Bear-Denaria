extends Control
var atDrinkScreen = false
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.budget = rng.randi_range(3,8)*10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if atDrinkScreen and Globals.readyForTicket:	
		$ticketCollect.visible = true
		$ticketCollect/CollisionShape2D.disabled = false
	else:
		$ticketCollect.visible = false
		$ticketCollect/CollisionShape2D.disabled = true
		
	$budget/budgetNum.text = "$"+str(Globals.budget)

	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://Scenes/Titlescreen/title_screen.tscn")


func _on_order_button_pressed():
	$button.play()
	atDrinkScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/taking_an_order.global_position + Vector2(500,350)

	


func _on_grill_button_pressed():
	$button.play()
	atDrinkScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/GrillArea.global_position + Vector2(500,350)
	

func _on_build_button_pressed():
	$button.play()
	atDrinkScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/build_area.global_position + Vector2(500,350)



func _on_fry_button_pressed():
	$button.play()
	atDrinkScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/fryArea.global_position + Vector2(500,350)


func _on_drink_button_pressed():
	$button.play()
	atDrinkScreen = true
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/drinkArea.global_position + Vector2(500,350)
	if Globals.readyForTicket:
		$ticketCollect.visible = true
		$ticketCollect/CollisionShape2D.disabled = false




func _on_backgroun_sound_finished():
	$backgrounSound.play()
	

