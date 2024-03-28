extends Area2D
var mouseEnerted = false
var followMouse = false
var mouseCollide = false
var defaultPosition
var snapPos
var cupEntered = false
var onPlate = false
var onPlate2 = false
var pressedButton = false
var countButton = 0
var no_more = false
var percent = 100
@onready var timerr = $/root/pop_machine/Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timerr.wait_time = 10
	timerr.one_shot = false
	timerr.autostart = true
	defaultPosition = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(pressedButton)
	if pressedButton == true:
		no_more = true
		#$/root/pop_machine/cup/sodalevel25.visible = true
		print("yup")
		#print($/root/pop_machine/soda_bar.value)
		#$/root/pop_machine/soda_bar.value+=0.6
	if !pressedButton and !timerr.is_stopped():
		timerr.stop()
		
	if Input.is_action_just_pressed("mouseClick") and mouseEnerted and onPlate == false and onPlate2 == false:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse and onPlate == false and onPlate2 == false:
		self.position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick"):
		followMouse = false
		

func _physics_process(delta):
	pass
func _on_mouse_entered():
	mouseEnerted = true


func _on_mouse_exited():
	mouseEnerted = false


func _on_plate_for_cup_mouse_entered():
	cupEntered = true
	snapPos = defaultPosition
	mouseEnerted = false
	onPlate = true
func setSnap(pos):
	snapPos = defaultPosition
	


func _on_plate_for_cup_2_mouse_entered():
	cupEntered = true
	snapPos = defaultPosition
	mouseEnerted = false
	onPlate2 = true








func _on_timer_timeout():
	#$/root/pop_machine/soda_bar.value+=1
	pass
