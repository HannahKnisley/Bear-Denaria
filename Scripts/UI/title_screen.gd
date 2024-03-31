extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()



func _on_start_button_pressed():
	
	$startButton/buttton.play()
	await $startButton/buttton.finished
	
	get_tree().change_scene_to_file("res://Scenes/dayscreen/dayscreen.tscn")
	
	


func _on_credits_button_pressed():
	
	$creditsButton/buttton.play()
	await $creditsButton/buttton.finished
	get_tree().change_scene_to_file("res://Scenes/Credits/credits.tscn")


func _on_quit_button_pressed():
	$quitButton/buttton.play()
	await $quitButton/buttton.finished
	get_tree().quit()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
