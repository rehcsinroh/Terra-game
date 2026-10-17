extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	move_and_slide()

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(-16, -24),
		Vector2(16, -24),
		Vector2(16, 24),
		Vector2(-16, 24)
	])
	$Polygon2D.color = Color("#42a5f5")
