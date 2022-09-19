extends VehicleBody

var steer_input := 0.0
var throttle_input := 0.0
var brake_input := 0.0
export var engine_power := 500
export var brake_power := 10
export var max_rpm = 1000

#get each wheel so we can apply artificial mechanical drag to the engine force
#so we cant accelerate infinately
onready var back_left_wheel : VehicleWheel = $back_left_wheel
onready var back_right_wheel : VehicleWheel = $back_right_wheel


func _process(delta: float) -> void:
	#lerp the input values for smoother input
	steer_input = lerp(steer_input, Input.get_axis("steer_right","steer_left") * 0.4, 0.25)
	throttle_input = lerp(throttle_input, Input.get_action_strength("accelerate"),0.25)
	brake_input = lerp(brake_input, Input.get_action_strength("brake") * brake_power, 0.5)


func _physics_process(delta: float) -> void:
	#apply the input values to vehicle body
	steering = steer_input
	brake = brake_input
	apply_engine_forces()

func apply_engine_forces():
	#for each wheel
	var rpm_left = back_left_wheel.get_rpm()
	var force_left  = throttle_input * (1.0 - rpm_left/max_rpm)
	back_left_wheel.engine_force = force_left * engine_power
	var rpm_right = back_right_wheel.get_rpm()
	var force_right  = throttle_input * (1.0 - rpm_right/max_rpm)
	back_left_wheel.engine_force = force_right * engine_power
