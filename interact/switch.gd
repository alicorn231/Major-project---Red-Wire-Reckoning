extends Interactable

var playback: AnimationNodeStateMachinePlayback
var on := false

func _ready():
	playback = $AnimationTree.get("parameters/playback")
	connect("interacted", Callable(self, "_interact"))

func interact(body):
	print("click")
	var switch_num := 0
	match name:
		"Switch_1": switch_num = 0
		"Switch_2": switch_num = 1
		"Switch_3": switch_num = 2
		"Switch_4": switch_num = 3

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
