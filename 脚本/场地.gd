extends Node2D

@export var 敌人:PackedScene

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("鼠标左键")):
		#飞剑.移动到(get_global_mouse_position())
		#导弹.移动到(get_global_mouse_position())
		#var 敌人实例=敌人.instantiate()
		#add_child(敌人实例)
		#敌人实例.position=get_global_mouse_position()
		pass
