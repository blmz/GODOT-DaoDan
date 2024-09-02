extends Sprite2D

@export var 爆炸粒子:PackedScene
@export var 速度:float=500
@export var 转向速度:float=200

var 当前方向:Vector2
var 目标方向:Vector2
var 移动目标:Node
var 目标位置:Vector2

var 是否移动:bool=true
var 是否顺时针:bool=true
var 目标角度:float
var 角度差值:float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	目标位置=移动目标.position
	旋转移动(delta)

func 移动到(目标:Node):
	移动目标=目标

func 旋转移动(delta:float):
	if(!是否移动):
		return 0
	position+=当前方向*速度*delta
	目标方向=(目标位置-position).normalized()
	当前方向= Vector2.UP.rotated(rotation) #获取当前方向矢量值
	var 误差值=delta*10
	角度差值=rad_to_deg(当前方向.angle_to(目标方向))
	if(角度差值>误差值): #根据角度正转还是反转
		rotation_degrees+=转向速度*delta
	elif(角度差值<-误差值):
		rotation_degrees-=转向速度*delta
		
func 爆炸():
	是否移动=false
	var 爆炸粒子实例:GPUParticles2D=爆炸粒子.instantiate()
	爆炸粒子实例.position=position
	get_tree().current_scene.add_child(爆炸粒子实例)
	queue_free()

func _on_转向速度_drag_ended(value_changed: bool) -> void:
	转向速度=$"../转向速度".value

func _on_移动速度_drag_ended(value_changed: bool) -> void:
	速度=$"../移动速度".value

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("敌人")):
		爆炸()
