extends StaticBody2D




signal pressed()



func _on_area_2d_body_entered(_body):
	pressed.emit()
	$AnimatedSprite2D.play("pressed")
	
	
	



func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("default")
