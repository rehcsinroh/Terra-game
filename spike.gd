extends Area2D

func _ready():
	$Polygon2D.polygon = PackedVector2Array([
		Vector2(0, 0),
		Vector2(30, 0),
		Vector2(15, -25.98)
	])

	$Polygon2D.color = Color("red")

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("respawn"):
		body.respawn()
