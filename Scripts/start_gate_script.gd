extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enabled = false

signal start_gate_reached(checkpoint_position)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("start_gate_reached", get_parent(), "_on_start_gate_reached")


func is_enabled():
	enabled = true
	$Area.set_deferred("monitoring", true)


func _on_Area_area_entered(area):
	emit_signal("start_gate_reached", area.global_transform)
	$Area.set_deferred("monitoring", false)
