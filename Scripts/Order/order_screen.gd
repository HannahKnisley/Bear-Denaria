extends Node2D
@export var Customer: PackedScene
var mob_num = 0
var name_customer = "bob"
# Called when the node enters the scene tree for the first time.
func _ready():
	var name_customer = "bob"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var mob = Customer.instantiate()
	
	
	if mob_num >= 3:
		
		remove_child(mob)
	else:
		
		mob_num+=1
		print(mob_num)
		self.add_child(mob)
		mob.global_position = $spawnHere.global_position
		


