extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var checkpoints_number
var laps_number


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func race_start(checkpoints, laps):
	checkpoints_number = checkpoints
	laps_number = laps
	$VBoxContainer/Checkpoint.text = "0/"+ String(checkpoints_number) + " checkpoints"
	$VBoxContainer/Lap.text = "0/" + String(laps_number) + " laps"

func update_ui_information(checkpoint_number, lap):
	$VBoxContainer/Checkpoint.text = String(checkpoint_number) + "/"+ String(checkpoints_number) + " checkpoints"
	$VBoxContainer/Lap.text = String(lap) + "/" + String(laps_number) + " laps"

func update_lap(lap):
	pass
