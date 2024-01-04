extends Node2D


var game_over: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	game_over = true
	visible = true


func end_game():
	game_over = true


func _process(_delta):
	if game_over == false:
		position.x += -3.5

	if position.x <= -578:
		position.x = 0


func start_game():
	game_over = false
	visible = true
