extends Spatial

var last_checkpoint
onready var player = $"%Player"
onready var checkpoint_position = $"%Start Gate".global_translation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("reset"):
		reset_car_position()

func _race_start(checkpoints, laps):
	$"%UI".race_start(checkpoints, laps)

func _update_ui_information(respawn_translation, checkpoint_number, lap):
	$"%UI".update_ui_information(checkpoint_number, lap)
	checkpoint_position = respawn_translation

func course_finished():
	pass

func reset_car_position():
	player.global_translation = checkpoint_position
