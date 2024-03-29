extends Area2D

var sentToFries = false
var inFryWait = false

var sentToDrink = false
var inDrinkWait = false

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
		

	if inFryWait and self.get_index()==0:
		if $/root/WorldRoot/fryArea/curTray.get_child_count() == 0:
			self.reparent($/root/WorldRoot/fryArea/curTray)
			self.visible = true
			inFryWait = false
			
	if inDrinkWait and self.get_index()==0:
		if $/root/WorldRoot/pop_machine/curTray.get_child_count() == 0:
			self.reparent($/root/WorldRoot/pop_machine/curTray)
			self.visible = true
			inDrinkWait = false


func _on_child_entered_tree(node):
	if node.is_in_group("theBurger") and !sentToFries:
		sentToFries = true
		await get_tree().create_timer(1).timeout
		self.reparent($/root/WorldRoot/fryArea/trayHolder)
		await get_tree().create_timer(1).timeout
		self.visible = false
		inFryWait = true
			
	elif node.is_in_group("fries") and !sentToDrink:
		sentToDrink = true
		await get_tree().create_timer(1).timeout
		self.reparent($/root/WorldRoot/pop_machine/trayHolder)
		await get_tree().create_timer(2).timeout
		self.visible = false
		inDrinkWait = true

