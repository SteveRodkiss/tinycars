extends Spatial


var checkpoint_nodes
var start_gate_node
var gamem_manager_node

var checkpoints_reached = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_nodes = get_children()
	checkpoint_nodes.pop_at(0)
	start_gate_node = get_child(0)

func _on_checkpoint_reached():
	checkpoints_reached += 1
	if checkpoints_reached == checkpoint_nodes.size():
		lap_enabled()

func lap_enabled():
	start_gate_node.is_enabled()
