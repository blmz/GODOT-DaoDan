extends CharacterBody2D
@export var 导弹:PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var 敌人目标:Node

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("玩家左","玩家右","玩家上","玩家下").normalized()
	velocity= direction * SPEED
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("鼠标左键")):
		发射导弹(position,(get_global_mouse_position()-position).angle()+PI*0.5,true,敌人目标)
	if(event.is_action_pressed("导弹发射")):
		var 角度=0
		while true:
			发射导弹(position,角度,false,敌人目标)
			角度+=30
			if(角度>360):
				break
 
func 发射导弹(位置:Vector2=Vector2.ZERO,角度:float=0,是否弧度=true,目标:Node=Node.new()):
	敌人目标= get_tree().current_scene.find_child("敌人")
	if (敌人目标==null):
		return 0
	var 导弹实例:Node=导弹.instantiate()
	if(是否弧度):
		导弹实例.rotation= 角度
	else:
		导弹实例.rotation_degrees=角度
	导弹实例.position=位置
	get_tree().current_scene.add_child(导弹实例)
	导弹实例.移动到(敌人目标)
