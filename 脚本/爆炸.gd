extends GPUParticles2D


func _ready() -> void:
	restart()

func _on_finished() -> void:
	queue_free()
