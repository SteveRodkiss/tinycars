extends Camera

export var target_node : NodePath
onready var _target : Spatial = get_node(target_node)

export var offset := Vector3(10,10,10)

func _ready() -> void:
	look_at(_target.transform.origin,Vector3.UP)
	pass
	
func _physics_process(delta: float) -> void:
	#move camera to the target position + offset
	global_transform.origin = _target.global_transform.origin + offset



