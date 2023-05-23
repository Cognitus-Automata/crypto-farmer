extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer # assigned after the node and it's children have entered the scene.
@export var player_speed = 5.0 # @export exports the variable to the Editor.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animate_character()
	var movement_vector = get_movement()
	velocity = movement_vector * player_speed
	move_and_slide()

# Returns new position to move the character to.
func get_movement():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	return Vector2(x_movement, y_movement).normalized()


# Plays an animation depending on the button being pressed.
func animate_character():
	if Input.is_action_pressed("move_right"):
		_animation_player.play("walk_right")
	elif Input.is_action_pressed("move_left"):
		_animation_player.play("walk_left")
	elif Input.is_action_pressed("move_down"):
		_animation_player.play("walk_down")
	elif Input.is_action_pressed("move_up"):
		_animation_player.play("walk_up")
	else:
		_animation_player.stop()
		
		
	
