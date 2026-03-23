extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@onready var computer = get_parent().get_node("Computer")
@onready var ball = get_parent().get_node("Ball")
@export var speed = 400
var screen_size
var direction

var ball_location
signal point_to_computer
signal point_to_player

var turn 

func _ready() -> void:
	new_game()

func new_game(x=[1, 2, 3].pick_random(), y=[1, 2, 3].pick_random()):
	direction = get_direction(x,y)
	
func set_turn(t):
	turn = t
	return turn
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("resume"):
		if turn == "computer":
			new_game([-1, -2, -3].pick_random(), [-1, -2, -3].pick_random())
		if turn == "player":
			new_game([1, 2, 3].pick_random(), [1, 2, 3].pick_random())
	var collision = move_and_collide(direction * speed * delta)
	var vel = direction * speed
	if collision:
		direction = direction.bounce(collision.get_normal())
		
		if collision.get_collider().name == "player":
			speed += 40
		if collision.get_collider().name == "computer":
			speed += 40
		#print(vel)
		
func get_direction(x, y) -> Vector2:
	var new_direction = Vector2.ZERO
	new_direction.x += x
	new_direction.y += y
		
	return new_direction.normalized()

func check_ball_path():
	var player_pos = player.position
	var comp_pos = computer.position
	if player_pos.x < ball.position.x:
		point_to_computer.emit()
	if abs(comp_pos.x) > abs(ball.position.x):
		point_to_player.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	check_ball_path()
