extends StaticBody2D




func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.play("pressed")


func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("default")
