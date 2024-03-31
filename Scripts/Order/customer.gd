extends Node2D
var nameOptions = ["bob", "Ella", "Erin", "Haley", "Hannah", "Desmond",
 "Dustin", "Simon", "Eeree", "Zach", "David", "Janna", "Tyler", "Jim", 
"Duane", "Jason", "Paul", "Travis", "Violet"]
var myName
var hasOrdered = false


var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	myName = nameOptions[rng.randi_range(0,len(nameOptions)-1)]
	self.get_child(rng.randi_range(0,2)).visible = true
	$bell.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.global_position != self.get_parent().global_position:
		self.translate((self.get_parent().global_position-self.global_position)*delta*10)
		

