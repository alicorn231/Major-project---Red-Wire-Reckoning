extends Node3D
#import Tim
var nodes = []
var grey = StandardMaterial3D.new()
var red = StandardMaterial3D.new()
var seconds_left = 120
var range = "seconds"
var num_minutes = 0
var num_seconds = 0
var min_tens_place = 0 
var min_ones_place = 0 
var sec_tens_place = 0 
var sec_ones_place = 0 

func add_value(column):
	var add = 0
	if column == 4:
		add = 21
	elif column == 3:
		add = 14
	elif column == 2:
		add = 7
	return add

func set_all(material):
	for node in nodes:
		if node is MeshInstance3D:
			node.material_override = material
			
func set_zero(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red
	nodes[3+add].material_override = red
	nodes[4+add].material_override = red
	nodes[5+add].material_override = red
	
func set_one(add):
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red

func set_two(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[3+add].material_override = red
	nodes[4+add].material_override = red
	nodes[6+add].material_override = red

func set_three(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red
	nodes[3+add].material_override = red
	nodes[6+add].material_override = red

func set_four(add):
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red
	nodes[5+add].material_override = red
	nodes[6+add].material_override = red

func set_five(add):
	nodes[add].material_override = red
	nodes[2+add].material_override = red
	nodes[3+add].material_override = red
	nodes[5+add].material_override = red
	nodes[6+add].material_override = red

func set_six(add):
	nodes[add].material_override = red
	nodes[2+add].material_override = red
	nodes[3+add].material_override = red
	nodes[4+add].material_override = red
	nodes[5+add].material_override = red
	nodes[6+add].material_override = red
	
func set_seven(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red

func set_eight(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red
	nodes[3+add].material_override = red
	nodes[4+add].material_override = red
	nodes[5+add].material_override = red
	nodes[6+add].material_override = red
	
func set_nine(add):
	nodes[add].material_override = red
	nodes[1+add].material_override = red
	nodes[2+add].material_override = red
	nodes[5+add].material_override = red
	nodes[6+add].material_override = red

func flash(range):
	for i in range(range):
		set_all(red)
		await get_tree().create_timer(0.5).timeout
		set_all(grey)
		await get_tree().create_timer(0.5).timeout


func _ready():
	for i in range(28):
		var node = get_node("timer2/" + str(i))
		nodes.append(node)
		
	red.albedo_color = Color(1,0 ,0)
	grey.albedo_color = Color(0.2, 0.2, 0.2)
	set_all(grey)
	#var timer = time

	while seconds_left >= 0: 
		set_all(grey)
		num_minutes = int(seconds_left / 60)
		num_seconds = seconds_left % 60 
		
		min_tens_place = int(num_minutes / 10)
		min_ones_place = num_minutes % 10

		sec_tens_place = int(num_seconds / 10)
		sec_ones_place = num_seconds % 10
		
		var columns = [min_tens_place, min_ones_place, sec_tens_place, sec_ones_place]
		print(columns)
		
		var column = 1
		for num in columns:
			var add = add_value(column)
			match num:
				1: set_one(add)
				2: set_two(add)
				3: set_three(add)
				4: set_four(add)
				5: set_five(add)
				6: set_six(add)
				7: set_seven(add)
				8: set_eight(add)
				9: set_nine(add)
				0: set_zero(add)
			column += 1  # this was missing too, probably!
		
		await get_tree().create_timer(1).timeout
		seconds_left -= 1

	await flash(5)
	
	
