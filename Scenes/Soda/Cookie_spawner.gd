extends Area2D
@export var cookie: PackedScene
var canSpawn = false
var newCookie
var defaultPosition
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_item()
	defaultPosition = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick"):
		
		if canSpawn:
			spawn_item()


func spawn_item():
	var numm = 0
	newCookie = cookie.instantiate()
	numm+=1
	
	print(numm)
	self.add_child(newCookie)
	newCookie.global_position = self.global_position
	
	

func _on_mouse_entered():
	canSpawn = false


func _on_mouse_exited():
	canSpawn = true


func _on_body_entered(body):
	$/root/WorldRoot/cookie.onPlate = true
	defaultPosition
	if body.is_in_group("cookie"):
		print("ahhhh")


func _on_cookieplate_body_entered(body):
	if body.is_in_group("cookie"):
		$/root/WorldRoot/cookie.onPlate = true
