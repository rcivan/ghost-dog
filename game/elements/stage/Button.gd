extends StaticBody2D




signal pressed()
signal depressed()


func _on_area_2d_body_entered(_body):
	pressed.emit()
	$AudioStreamPlayer.play(0)
	$AnimatedSprite2D.play("pressed")
	
	
	



func _on_area_2d_body_exited(_body):
	depressed.emit()
	$AnimatedSprite2D.play("default")
