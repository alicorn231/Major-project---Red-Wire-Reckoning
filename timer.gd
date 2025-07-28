extends Node3D
#import Tim
var nodes = []

func _ready():
	for i in range(28):
		var node = get_node("timer2/" + str(i))
		nodes.append(node)
	print(nodes)
	var time = 10
	
	var red = StandardMaterial3D.new()
	red.albedo_color = Color(1, 0, 0) 
	
	var grey = StandardMaterial3D.new()
	grey.albedo_color = Color(0.5, 0.5, 0.5)
	
	nodes[0].material_override = red
	await get_tree().create_timer(3.0).timeout
	nodes[0].material_override = grey
