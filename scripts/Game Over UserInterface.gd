extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false



func end_game():
	visible = true


func _on_button_pressed():
	get_tree().call_group("start_game", "start_game")
	visible = false
