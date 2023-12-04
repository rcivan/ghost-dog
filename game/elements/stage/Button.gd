extends StaticBody2D

@export var number: int 


signal pressed(id)



func _on_area_2d_body_entered(_body):
	pressed.emit(number)
	$AnimatedSprite2D.play("pressed")
	
	
	



func _on_area_2d_body_exited(body):
	$AnimatedSprite2D.play("default")
