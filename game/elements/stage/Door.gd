extends Node2D

@export var number: int

# Called when the node enters the scene tree for the first time.


func open_door():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(3,1), 0.5)
	get_node("StaticBody2D").set_collision_layer_value(1,false)
	

func close_door():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.8,1), 0.5)




func _on_static_body_2d_pressed(id):
	if id == number:
		open_door()
