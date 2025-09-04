#extends Node3D
extends Interactable

var playback: AnimationNodeStateMachinePlayback
var on := false

func _ready():
	playback = $AnimationTree.get("parameters/playback")
	connect("interacted", Callable(self, "_interact"))

func interact(body):
	var wire_num := 0
	match name:
		"red_wire": wire_num = 0
		"blue_wire": wire_num = 1
		"green_wire": wire_num = 2
		"yellow_wire": wire_num  = 3

	print("Switch hit", switch_num)

	if not on:
		turn_on()
	else:
		turn_off()
	get_parent().change_state(switch_num)

func turn_on():
	playback.travel("on")
	on = true

func turn_off():
	playback.travel("of")
	on = false
