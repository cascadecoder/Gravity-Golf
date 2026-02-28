extends CharacterBody2D

var mouseDown = false
var mousePos = Vector2(0,0)
var mouseAngle = 0.0
var speed = 5000

func _input(event):
	if (event.is_action_pressed("mouseDown")):
		mouseDown = true

	elif (event.is_action_released("mouseDown")):
		mouseDown = false

func _physics_process(delta: float):
	# friction
	velocity *= 0.8
	
	if (mouseDown):
		# get mouse pos relative to player
		mousePos = get_viewport().get_mouse_position()
		var mouseBounds = mousePos - get_viewport_rect().size / 2
		# calculate angle + dx & dy vals
		mouseAngle = atan(mouseBounds.y / mouseBounds.x)
		if (mouseBounds.x <= 0) :
			mouseAngle += PI
		var dpos = Vector2(cos(mouseAngle), sin(mouseAngle)) * speed
		# update velocity
		velocity += dpos * delta

	
	move_and_slide()
