extends Spatial

var enabled = true

signal checkpoint_reached(area)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("checkpoint_reached", get_parent(), "_on_checkpoint_reached")


func _on_Area_area_entered(area):
	$Area.set_deferred("monitoring", false)
	emit_signal("checkpoint_reached", area.global_translation)

func is_enabled():
	$Area.set_deferred("monitoring", true)
