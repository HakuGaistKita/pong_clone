extends AnimatableBody2D


var screen_size
var direction
@onready var computer = get_parent().get_node("Computer")
@onready var ball = get_parent().get_node("Ball")
@export var speed = 200

signal point_to_player

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x * 0.1 , screen_size.y / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var ball_pos = ball.position
	var comp_pos = computer.position
	var dist_y = comp_pos.y - ball_pos.y
	#print(ball.direction.x)
	
	if ball_pos.x < screen_size.x / 3 && ball_pos.x > comp_pos.x:
		if abs(dist_y) > 50:
				if ball_pos.y > comp_pos.y:
					var move = Vector2(0, +2)
					move_and_collide(move * speed * delta)
				if ball_pos.y < comp_pos.y:
					var move = Vector2(0, -2)
					move_and_collide(move * speed * delta)
	if ball_pos.x < comp_pos.x:
		point_to_player.emit()
