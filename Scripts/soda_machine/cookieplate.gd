extends Area2D
var enteredd = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	enteredd = true


func _on_mouse_exited():
	enteredd = false


func _on_body_entered(body):
	print(body)


func _on_area_entered(area):
	$cookie.onPlate = true
