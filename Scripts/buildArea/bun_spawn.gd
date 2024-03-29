extends Area2D

@export var topBun: PackedScene
@export var bottomBun: PackedScene

var newTopping
var canSpawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick"):
		await get_tree().create_timer(0.1).timeout
		if canSpawn:
			spawn_item()


func spawn_item():
	if Globals.lastBun == "bottom":
		newTopping = topBun.instantiate()
		Globals.lastBun = "top"
	elif Globals.lastBun == "top":
		newTopping = bottomBun.instantiate()
		Globals.lastBun = "bottom"
	self.add_child(newTopping)
	newTopping.global_position = self.global_position
	


func _on_body_entered(body):
	
	canSpawn = false


func _on_body_exited(body):
	canSpawn = true
