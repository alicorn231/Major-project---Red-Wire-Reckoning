extends Interactable


#@export var item_id : String

var playback: AnimationNodeStateMachinePlayback
var on := false


func _ready():
	playback = $AnimationTree.get("parameters/playback")
	connect("interacted", Callable(self, "_interact"))

func interact(body):
	print("Click, interacted switch script")
	if not on:
		turn_on()
	else:
		turn_of()

func turn_on():
	playback.travel("on")
	on = true

func turn_of():
	playback.travel("of")
	on = false
#interact
