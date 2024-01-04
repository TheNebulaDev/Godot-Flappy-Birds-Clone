extends Control

@onready var current_score = $CurrentScoreNumber
@onready var high_score = $HighScoreNumber
var score = 0
var highscore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true


func start_game():
	visible = true


func update_score():
	score += 1
	current_score.text = str(score)

func end_game():
	highscore = score
	high_score.text = str(highscore)
	score = 0
	current_score.text = str(score)
