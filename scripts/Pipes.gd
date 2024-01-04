extends Node2D

var is_game_over: bool = false
var score_cooldown = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.y = randf_range(-150, 150)
	position.x = 1180


func end_game():
	is_game_over = true


func _process(_delta):
	if is_game_over == false:
		position.x += -3.5
	
	if position.x <= -40:
		queue_free()
	
	if score_cooldown != 0:
		score_cooldown -= 1


func _on_pipe_up_body_entered(body):
	if body.is_in_group("Flappy") && is_game_over == false:
		get_tree().call_group("end_game", "end_game")



func _on_pipe_down_body_entered(body):
	if body.is_in_group("Flappy") && is_game_over == false:
		get_tree().call_group("end_game", "end_game")


func start_game():
	queue_free()



func _on_score_hitbox_body_entered(body):
	if body.is_in_group("Flappy") && is_game_over == false:
		if score_cooldown == 0:
			score_cooldown = 5
			get_tree().call_group("score", "update_score")
