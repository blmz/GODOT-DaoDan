extends Line2D

@export var 最大数量 = 100
var 点列表:Array[Vector2]

func _process(delta):
	点列表.push_front($"../尾部".global_transform.origin)
	if(点列表.size()>最大数量):
		点列表.resize(最大数量)
	points=点列表
