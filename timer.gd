extends Node3D
#import Time

@onready var zero = $"timer2/0"
#var one = $"timer2/1"
#var two = $"timer2/2"
#var three = $"timer2/3"
#var four = $"timer2/4"
#var five = $"timer2/5"
#var six = $"timer2/6"
#var seven = $"timer2/7"
#var eight = $"timer2/8"
#var nine = $"timer2/9"
#var ten = $"timer2/10"
#var eleven = $"timer2/11"
#var twelve = $"timer2/12"
#var thirteen = $"timer2/13"
#var fourteen = $"timer2/14"
#var fifteen = $"timer2/15"
#var sixteen = $"timer2/16"
#var seventeen = $"timer2/17"
#var eighteen = $"timer2/18"
#var nineteen = $"timer2/19"
#var twenty = $"timer2/20"
#var twentyone = $"timer2/21"
#var twentytwo = $"timer2/22"
#var twentythree = $"timer2/23"
#var twentyfour = $"timer2/24"
#var twentyfive = $"timer2/25"
#var tweentysix = $"timer2/26"
#var twentyseven = $"timer2/27"

#numbers = [zero]

#numbers = [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twentyone, twentytwo, twentythree, twentyfour, twentyfive, tweentysix, twentyseven]

var time = 10

func _ready():
	var red = StandardMaterial3D.new()
	red.albedo_color = Color(1, 0, 0) 
	var grey = StandardMaterial3D.new()
	grey.albedo_color = Color(0.5, 0.5, 0.5)
	zero.material_override = red
	await get_tree().create_timer(3.0).timeout
	zero.material_override = grey
	

#var digits_map = {
	#0: [1,1,1,1,1,1,0],
	#1: [0,1,1,0,0,0,0],
	#2: [1,1,0,1,1,0,1],
	#3: [1,1,1,1,0,0,1],
	#4: [0,1,1,0,0,1,1],
	#5: [1,0,1,1,0,1,1],
	#6: [1,0,1,1,1,1,1],
	#7: [1,1,1,0,0,0,0],
	#8: [1,1,1,1,1,1,1],
	#9: [1,1,1,1,0,1,1],
#}
#
#
	# Assuming 'my_object' is a MeshInstance3D node
	#my_object.mesh.material.albedo_color = Color(1, 0, 0) # Sets color to red
