extends CharacterBody2D

@export var speed = 200
@export var jump_speed = -300
@export_range(0.0, 1.0) var friction = 0.2
@export_range(0.0 , 1.0) var acceleration = 0.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y += gravity * delta
	var dir = Input.get_axis("ui_left", "ui_right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	if Input.is_action_just_released("ui_accept") && velocity.y < 0:
		velocity.y = 0

	move_and_slide()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
	
	#s$Sprite2D.Sca
	#sprite.scale = sprite.scale.linear_interpolate(Vector2(1, 1), delta * 8)
	
	#if is_on_floor() and !previouslyFloored:
		#sprite.scale = Vector2(1.25, 0.75)
