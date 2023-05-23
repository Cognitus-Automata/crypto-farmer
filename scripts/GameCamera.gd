extends Camera2D

var object_position = Vector2.ZERO
var slide_smoothness = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	aquire_object()
	global_position = global_position.lerp(object_position, 1.0 - exp(-delta * slide_smoothness))


func aquire_object():
	var player_node = get_tree().get_nodes_in_group("Player")

	if player_node.size() > 0:
		var player = player_node[0]
		object_position = player.global_position
