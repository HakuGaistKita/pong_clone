extends Node

var score = 0
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func _on_player_point_to_computer() -> void:
	#score += 1
	#$HUD.update_computer_score(score)
	#$Ball.queue_free()

func _on_hud_start_game() -> void:
	$Start_Timer.start()
	$HUD.game_start()
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)


func _on_start_timer_timeout() -> void:
	pass # Replace with function body.


func _on_ball_point_to_computer() -> void:
	score += 1
	$HUD.update_computer_score(score)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	$Ball.new_game(0,0)
	$Ball.set_turn("player")
	

func _on_ball_point_to_player() -> void:
	score += 1
	$HUD.update_player_score(score)
	$Ball.position = Vector2(screen_size.x / 2, screen_size.y / 2)
	$Ball.new_game(0,0)
	$Ball.set_turn("computer")
	
