extends Control




func _on_restart_button_pressed():
	#play sound effect, reset scene
	var player = get_parent()
	player.respawn()
