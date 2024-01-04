extends Node

var Spawn_Timer = 0
var scene = preload("res://scenes/pipes.tscn")
var is_game_over: bool = false


func _ready():
	is_game_over = true


func inst():
	var instance = scene.instantiate()
	add_child(instance)
 
func end_game():
	is_game_over = true
	


func _process(_delta):
	if is_game_over == false:
		if Spawn_Timer == 0 && is_game_over == false:
			inst()
			Spawn_Timer = 100
	
		if Spawn_Timer >= 0:
			Spawn_Timer -= 1


func start_game():
	is_game_over = false
	Spawn_Timer = 0


