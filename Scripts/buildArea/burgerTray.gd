extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() > 2:
		for i in range(2,self.get_child_count()):
			if self.get_child(i).global_position != self.global_position:
				self.get_child(i).translate((self.global_position-self.get_child(i).global_position)*delta*10)
			
	if self.global_position != self.get_parent().global_position:
		self.translate((self.get_parent().global_position-self.global_position)*delta*10)


func _on_child_entered_tree(node):
	if node.is_in_group("theBurger"):
		await get_tree().create_timer(1).timeout
		self.reparent($/root/WorldRoot/fryArea/trayHolder)

