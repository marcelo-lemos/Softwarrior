extends CPUParticles2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_emitting = false
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	#return
	if(!is_emitting):
		if(modulate.a > 0):
			modulate.a -= 0.05
		else:
			emitting = false

func stop_emitting():
	is_emitting = false
	$Timer.start()
	#emitting = false


func _on_Timer_timeout():
	emitting = false

func start_emitting():
	#emitting = false
	restart()
	modulate.a = 1
	emitting = true
	is_emitting = true
	$Timer.stop()

