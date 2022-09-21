extends Spatial


var checkpoint_nodes
var start_gate_node
var game_manager_node

var checkpoints_reached = 0
var laps_completed = 0
export var max_laps = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_nodes = get_children()
	checkpoint_nodes.pop_at(0)
	start_gate_node = get_child(0)
	game_manager_node = get_parent()
	print("number of checkpoints: " + String(checkpoint_nodes.size()))

func _on_checkpoint_reached():
	checkpoints_reached += 1
	if checkpoints_reached == checkpoint_nodes.size():
		lap_enabled()
	print("checkpoint " + String(checkpoints_reached) + "/" + String(checkpoint_nodes.size()))
		
func _on_start_gate_reached():
	laps_completed += 1
	if laps_completed == max_laps:
		print("win")
	else:
		print(laps_completed)
		reset_course()

func lap_enabled():
	start_gate_node.is_enabled()

func reset_course():
	for checkpoint in checkpoint_nodes:
		checkpoint.is_enabled()
	checkpoints_reached = 0
	print("checkpoint " + String(checkpoints_reached) + "/" + String(checkpoint_nodes.size()))
