extends Node

var switch_state := [0, 0, 0, 0]
signal deactivate
signal activate

func change_state(index: int) -> void:
	switch_state[index] = 1 - switch_state[index] # toggle
	print("Switch states:", switch_state)

	if switch_state == [0, 1, 0, 0]:
		print("hi")
		emit_signal("deactivate")
	
	if switch_state == [0, 1, 1, 0]:
		print("AAHHH")
		emit_signal("activate")
	
