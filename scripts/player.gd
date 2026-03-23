extends AnimatableBody2D


@onready var player = get_parent().get_node("Player")
@onready var ball = get_parent().get_node("Ball")
@export var speed = 500
var velocity
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x * 0.9 , screen_size.y / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	var move = Vector2(0, Input.get_axis("up", "down"))
	var collision = move_and_collide(move * speed * delta)
