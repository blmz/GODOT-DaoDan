extends Sprite2D

var 移动速度:float=500
var 移动距离:float=300
var 当前移动距离:float
var 是否下移:bool=true
var 起点:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	起点=position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if 是否下移:
		position.y+=移动速度*delta
	else:
		position.y-=移动速度*delta
	if(position.y-起点.y>移动距离):
		是否下移=false
	elif(position.y-起点.y<-移动距离):
		是否下移=true
func _on_rigid_body_2d_area_entered(area: Area2D) -> void:
	pass
