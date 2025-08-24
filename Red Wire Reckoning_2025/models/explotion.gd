extends Node3D

var rng := RandomNumberGenerator.new()

@onready var gpu_particles := [
	$vfx_explostion_1/sparks,
	$vfx_explostion_1/Flash,
	$vfx_explostion_1/fire,
	$vfx_explostion_1/smoke
]

func explode():
	rng.randomize()
	var num = 0
	for particle in gpu_particles:
		num = rng.randi_range(0, 0.99)
		await get_tree().create_timer(num).timeout
		particle.visible = true
		particle.emitting = true
