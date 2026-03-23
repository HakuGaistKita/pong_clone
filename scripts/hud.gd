extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_computer_score(score):
	$computer_score.text = str(score)

func update_player_score(score):
	$player_score.text = str(score)


func _on_start_button_pressed() -> void:
	start_game.emit()

func game_start():
	$welcome_message.hide()
	$start_button.hide()
