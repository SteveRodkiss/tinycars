extends Spatial


var checkpoint_nodes
var start_gate_node
var game_manager_node

var checkpoints_reached = 0
var laps_completed = 0
export var max_laps = 1

signal race_start(checkpoints, laps)
signal update_ui_information(checkpoint_node, checkpoint_number, lap)
signal course_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_nodes = get_children()
	checkpoint_nodes.pop_at(0)
	start_gate_node = get_child(0)
	game_manager_node = get_parent()
	print("number of checkpoints: " + String(checkpoint_nodes.size()))
	connect("race_start", get_parent(), "_race_start")
	connect("update_ui_information", get_parent(), "_update_ui_information")
	connect("course_finished", get_parent(), "_course_finished")
	
	emit_signal("race_start", checkpoint_nodes.size(), max_laps)

func _on_checkpoint_reached(respawn_translation):
	checkpoints_reached += 1
	if checkpoints_reached == checkpoint_nodes.size():
		lap_enabled()
	print("checkpoint " + String(checkpoints_reached) + "/" + String(checkpoint_nodes.size()))
	emit_signal("update_ui_information", respawn_translation, checkpoints_reached, laps_completed)
		
func _on_start_gate_reached(respawn_translation):
	laps_completed += 1
	if laps_completed == max_laps:
		print("win")
	else:
		print("completed lap " + String(laps_completed))
		emit_signal("update_ui_information", respawn_translation, 0, laps_completed)
		reset_course()

func lap_enabled():
	start_gate_node.is_enabled()

func reset_course():
	for checkpoint in checkpoint_nodes:
		checkpoint.is_enabled()
	checkpoints_reached = 0
	print("checkpoint " + String(checkpoints_reached) + "/" + String(checkpoint_nodes.size()))
