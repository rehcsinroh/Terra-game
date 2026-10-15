extends StaticBody2D

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(-200, -20),
		Vector2(200, -20),
		Vector2(200, 20),
		Vector2(-200, 20)
	])

	$Polygon2D.color = Color("#43a047")
