extends Area2D
var mouseEnerted = false
var followMouse = false
var mouseCollide = false
var defaultPosition
var snapPos
var countOnPlate1 = 0
var countOnPlate2 = 0
var cupEntered = false
var onPlate = false
var onPlate2 = false
var pressedButton = false
var countButton = 0
var no_more = false
var percent = 100
var onEndPlate = false
@onready var timerr = $/root/pop_machine/Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	defaultPosition = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if pressedButton == true:
		no_more = true
		#$/root/pop_machine/cup/sodalevel25.visible = true
		
		#print($/root/pop_machine/soda_bar.value)
		#$/root/pop_machine/soda_bar.value+=0.6
	
		
	if Input.is_action_just_pressed("mouseClick") and mouseEnerted and onPlate == false and onEndPlate == false and onPlate2 == false:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse and onPlate == false and onEndPlate == false and onPlate2 == false:
		self.global_position = get_global_mouse_position()
		
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
	
	mouseEnerted = false
	onPlate = true
	countOnPlate1+=1
	if $/root/WorldRoot/pop_machine/cup/soda_bar.value == 100 or $/root/WorldRoot/pop_machine/cup/water_bar.value == 100 :
		onPlate = false
	elif $/root/WorldRoot/pop_machine/cup/water_bar.value == 100:
		onPlate2 = false
		
	else:
		snapPos = defaultPosition
		
func setSnap(pos):
	snapPos = defaultPosition
	


func _on_plate_for_cup_2_mouse_entered():
	
	cupEntered = true
	snapPos = defaultPosition
	mouseEnerted = false
	countOnPlate1+=1
	onPlate2 = true
	if $/root/WorldRoot/pop_machine/cup/water_bar.value == 100 or $/root/WorldRoot/pop_machine/cup/soda_bar.value == 100 :
		onPlate2 = false








func _on_timer_timeout():
	#$/root/pop_machine/soda_bar.value+=1
	pass






func _on_area_to_put_cup_mouse_entered():
	print("yup")
	cupEntered = true
	
	mouseEnerted = false
	onEndPlate = true
	snapPos = defaultPosition
