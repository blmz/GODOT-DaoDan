extends Sprite2D

@export var 速度:float=500
@export var 转向速度:float=200
var 当前方向:Vector2
var 目标方向:Vector2
var 目标位置:Vector2

var 是否旋转:bool=false
var 是否顺时针:bool=true
var 目标角度:float
var 角度差值:float

func _ready() -> void:
	移动到(目标位置)

func _process(delta: float) -> void:
	旋转移动(delta)

func 判断到达():
	if(position.is_equal_approx(目标位置)):
		移动到(目标位置)

func 移动到(位置:Vector2):
	目标位置=位置

func 旋转移动(delta:float):
	position+=当前方向*速度*delta
	目标方向=(目标位置-position).normalized()
	当前方向= Vector2.UP.rotated(rotation) #获取当前方向矢量值
	var 误差值=delta*10
	角度差值=rad_to_deg(当前方向.angle_to(目标方向))
	if(角度差值>误差值): #根据角度正转还是反转
		rotation_degrees+=转向速度*delta
	elif(角度差值<-误差值):
		rotation_degrees-=转向速度*delta

func _on_转向速度_drag_ended(value_changed: bool) -> void:
	转向速度=$"../转向速度".value

func _on_移动速度_drag_ended(value_changed: bool) -> void:
	速度=$"../移动速度".value
