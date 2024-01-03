extends Node2D


# Called when the node enters the scene tree for the first time.

@export var delay = 0
var initial_pos

func _ready():
	initial_pos = self.position

func open_door():
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position", 
		initial_pos + Vector2.UP * 300, 
		0.5
	)
	# get_node("DoorSprite/StaticBody2D").set_collision_layer_value(1,false)
	

func close_door():
	await get_tree().create_timer(delay).timeout
	
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position", 
		initial_pos , 
		0.5
	)
	# tween.tween_property(self, "scale", Vector2(0.8,1), 0.5)





