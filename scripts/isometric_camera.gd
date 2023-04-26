extends Camera

export var target_node : NodePath
onready var _target : Spatial = get_node(target_node)

export var offset := Vector3(10,10,10)

func _ready() -> void:
	pass

	
func _physics_process(delta: float) -> void:
	#move camera to the target position + offset
	global_transform.origin = _target.global_transform.origin + offset
	look_at(_target.global_transform.origin,Vector3.UP)



