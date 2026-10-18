extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0
const fall_height = 200
const WALL_JUMP_DURATION = 0.2
var spawn_position: Vector2
var wall_jump_push: float = 400.0
var wall_jump_timer: float = 0.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
	if wall_jump_timer > 0:
		wall_jump_timer -= delta
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif is_on_wall():
			var wall_normal = get_wall_normal()
			velocity.y = JUMP_VELOCITY
			velocity.x = wall_normal.x * wall_jump_push
			wall_jump_timer = WALL_JUMP_DURATION

	var direction = Input.get_axis("move_left", "move_right")
	
	if wall_jump_timer <= 0:
		velocity.x = direction * SPEED
	
	if global_position.y > fall_height:
		global_position = spawn_position
		velocity = Vector2.ZERO

	move_and_slide()
	
func respawn():
	global_position = spawn_position
	velocity = Vector2.ZERO
	wall_jump_timer = 0.0

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(-16, -16),
		Vector2(16, -16),
		Vector2(16, 16),
		Vector2(-16, 16)
	])
	$Polygon2D.color = Color("#42a5f5")
