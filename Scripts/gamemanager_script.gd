extends Spatial

var last_checkpoint
onready var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _race_start(checkpoints, laps):
	$"%UI".race_start(checkpoints, laps)

func _update_ui_information(checkpoint_node, checkpoint_number, lap):
	$"%UI".update_ui_information(checkpoint_number, lap)

func course_finished():
	pass
