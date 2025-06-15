extends RayCast3D


func _physics_process(delta):
	if is_colliding():
		print("smt")
