extends Node3D

#@onready var tween = Tween.new()
@onready var ticking = $ticking
@onready var drone = $drone
@onready var explotion = $explostion
@onready var music = $music
@onready var timer := $Timer
@onready var items := [
	$Bomb,
	#$"switch controler/Switch_1",
	$"switch controler/Switch_2",
	$"switch controler/Switch_3",
	#$"switch controler/Switch_4",
	$Timer
]
@onready var switch_controller = $"switch controler"

signal timer_finished

func _ready():
	ticking.play()
	drone.play()
	music.stop()
	switch_controller.activate.connect(drone.stop)
	switch_controller.deactivate.connect(drone.stop)
	switch_controller.activate.connect(ticking.stop)
	switch_controller.activate.connect(explotion.play)
	switch_controller.deactivate.connect(ticking.stop)
	switch_controller.deactivate.connect(music.play)
	switch_controller.activate.connect(music.stop)
	timer.timer_finished.connect(ticking.stop)
	timer.timer_finished.connect(drone.stop)
	timer.timer_finished.connect(explotion.play)
	
	if ticking.stream:           # make sure the stream exists
		ticking.stream.loop = true
	if drone.stream:           # make sure the stream exists
		drone.stream.loop = true
	if music.stream:           # make sure the stream exists
		music.stream.loop = true
	
	for bomb in $bombs.get_children():
		timer.timer_finished.connect(bomb.explode)
		switch_controller.activate.connect(bomb.explode)
	timer.timer_finished.connect(death)
	switch_controller.activate.connect(death)
	timer.timer_finished.connect($player.die)
	switch_controller.activate.connect($player.die)
	switch_controller.deactivate.connect(timer.deactivate)
	
	
func death():
	for item in items:
		item.visible = false
