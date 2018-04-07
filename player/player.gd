extends Node2D

const PLAYER_SPEED = 2 #pix/delta

var facing = "right"
var moving = false
onready var destination = get_position()
onready var size = Vector2(get_node("Sprite").get_texture().get_size())

func _input(event):
	if not moving:
		var x = get_position().x
		var y = get_position().y
		if event.is_action_pressed("move_up"):
			destination = Vector2(x, (y - size))
		elif event.is_action_pressed("move_down"):
			destination = Vector2(x, (y + size))
		elif event.is_action_pressed("move_left"):
			destination = Vector2((x - size), y)
		elif event.is_action_pressed("move_right"):
			destination = Vector2((x + size), y)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true)
	set_process_input(true)
	#pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#var rect = Rect2(get_loc(), size)
	var loc = get_position()
	if destination != loc:
		move_towards_dest(delta*PLAYER_SPEED)
	pass

func move_towards_dest(d):
	var loc = get_position()
	if loc.x < destination.x:
		loc.x += d
	elif loc.x > destination.x:
		loc.x -= d
	if loc.y < destination.y:
		loc.y += d
	elif loc.y > destination.y:
		loc.y -= d
	set_position(loc)