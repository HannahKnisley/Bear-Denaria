extends Area2D

var defaultPos
var out = true

var sliding = false
var pattyIn = false
var myPatty

# Called when the node enters the scene tree for the first time.
func _ready():
	defaultPos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and !sliding:
		if pattyIn:
			myPatty.reparent(self)
			myPatty.setSnap(self.global_position)
			myPatty.sliding = true
			sliding = true
	
	if sliding:
		slideOutAnimate(delta)
			


func _on_body_entered(body):
	if body.is_in_group("patty"):
		pattyIn = true
		myPatty = body


func _on_body_exited(body):
	if body.is_in_group("patty"):
		pattyIn = false

func slideOutAnimate(delta):
	if self.global_position < (defaultPos+Vector2(495,0)) and out:
		self.translate(((defaultPos+Vector2(500,0))-self.global_position)*delta*10)
		myPatty.move_and_collide(self.global_position-myPatty.global_position)
	else:
		out = false
		myPatty.reparent($/root/WorldRoot/build_area/pattyContainer)
		await get_tree().create_timer(0.1).timeout
		
	if self.global_position > (defaultPos+Vector2(7,0)) and !out:
		self.translate((defaultPos-self.global_position)*delta*10)
	elif !out:
		self.set_collision_mask_value(1, true)
		self.set_collision_mask_value(2, false)
		out = true
		sliding = false
		print("meow")
