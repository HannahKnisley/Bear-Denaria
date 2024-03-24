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
	mob_num+=1
	print(mob_num)
	mob.position = Vector2(50,30)
	
	add_child(mob)
	if mob_num >= 3:
		print("gone")
		remove_child(mob)
		


func _on_order_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Taking_order/taking_order.tscn")
