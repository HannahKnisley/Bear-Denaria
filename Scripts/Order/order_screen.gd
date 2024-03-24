extends Node2D
@export var Customer: PackedScene
var mob_num = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var mob = Customer.instantiate()
	mob_num+=1
	mob.position = Vector2(6,-61)
	
	add_child(mob)
	if mob_num == 8:
		remove_child(mob)
