extends Spatial

#find the target and try to steer to it
var target_position := Vector3.ZERO

#the target node
export var target : NodePath
onready var _target = get_node(target)

#the car parent so we can set the input
onready var car = get_parent() 

func _physics_process(delta: float) -> void:
	#get the relative direction
	var ai_input = get_ai_input(target_position)
	car.steer_input = ai_input.x
	car.throttle_input = ai_input.y

func get_ai_input(target : Vector3) -> Vector2:
	target_position = _target.global_translation
	var direction := Vector2.ZERO
	#first get the relative vector
	var direction_relative = (global_translation - target).normalized()
	#now get the dot product if positive turn right else turn left
	var steer_relative = direction_relative.dot(-global_transform.basis.x)
	direction.x = steer_relative * 0.5
	#now work out if we want to back backwards or forward
	var throttle_relative = direction_relative.dot(-global_transform.basis.z)
	if throttle_relative > 0.0:
		print("go go go")
		direction.y = throttle_relative
	else:
		#slow down to turn around!!
		if car.get_velocity() > 300:
			print("brake!", car.get_velocity())
			#brake
			direction.y = -1.0
		else:
			print("slow")
			direction.y = 0.05
	return direction
