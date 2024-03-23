extends Area2D

@export var patty: PackedScene

var canSpawn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_patty()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick"):
		await get_tree().create_timer(0.05).timeout
		if canSpawn:
			spawn_patty()



func spawn_patty():
	var newPatty = patty.instantiate()
	print(self.global_position)
	print(newPatty.global_position)
	self.add_child(newPatty)
	newPatty.global_position = self.global_position
	




func _on_body_entered(body):
	if body.is_in_group("patty"):
		canSpawn = false


func _on_body_exited(body):
	if body.is_in_group("patty"):
		canSpawn = true
