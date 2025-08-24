extends Node3D

@onready var timer := $Timer
@onready var items   := [$Bomb, $Switch_1, $Switch_2, $Timer]
@onready var bombs := [
	$bombs/bomb,
	$bombs/bomb2,
	$bombs/bomb3,
	$bombs/bomb4,
	$bombs/bomb5,
	$bombs/bomb6,
	$bombs/bomb7,
	$bombs/bomb8,
	$bombs/bomb9,
	$bombs/bomb10,
	$bombs/bomb11,
	$bombs/bomb12,
	$bombs/bomb13,
	$bombs/bomb14,
	$bombs/bomb15,
	$bombs/bomb16,
	$bombs/bomb17,
	$bombs/bomb18,
	$bombs/bomb19,
	$bombs/bomb20,
	$bombs/bomb21,
	$bombs/bomb22,
	$bombs/bomb23,
	$bombs/bomb24,
	$bombs/bomb25,
	$bombs/bomb26,
	$bombs/bomb27,
	$bombs/bomb28,
	$bombs/bomb29,
	$bombs/bomb30,
	$bombs/bomb31
]


signal timer_finished

func _ready():
	for bomb in bombs:
		timer.timer_finished.connect(bomb.explode)
	timer.timer_finished.connect(_on_timer_finished)   
	
func _on_timer_finished():
	for item in items:
		item.visible = false
