extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 10
var is_dead = false

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $neck
@onready var camera := $neck/Camera3D
@onready var you_died_screen = $you_died
var esc_was_pressed = false

func _ready():
	# Start in gameplay with OS cursor hidden & locked
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		_toggle_mouse_mode()
		#await get_tree().create_timer(10).timeout
		print("esc was clicked")
	# Left click re-captures mouse if currently visible
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	# Camera movement only if mouse is captured
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		neck.rotate_y(-event.relative.x * 0.01)
		camera.rotate_x(-event.relative.y * 0.01)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-50), deg_to_rad(60))

func _toggle_mouse_mode():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # show real OS cursor
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # hide & lock it

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("left", "right", "foward", "backward")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func die():
	is_dead = true
	await get_tree().create_timer(0.4).timeout

func show_death_screen():
	you_died_screen.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # release OS cursor

func respawn():
	you_died_screen.visible = false
	get_tree().reload_current_scene()
