extends Node2D


# Called when the node enters the scene tree for the first time.

@export var delay = 0.0
@export var speed = 12.0
@export var distance = 6
var initial_pos

func _ready():
	initial_pos = self.position
	
	print(.5)
func open_door():
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position",
		initial_pos + (Vector2.UP * distance*50).rotated(self.rotation), 
		float(distance)/speed
	)
	# get_node("DoorSprite/StaticBody2D").set_collision_layer_value(1,false)
	

func close_door():
	await get_tree().create_timer(delay).timeout
	
	var tween = create_tween()
	tween.tween_property(
		self, 
		"position", 
		initial_pos , 
		float(distance)/speed
	)
	# tween.tween_property(self, "scale", Vector2(0.8,1), 0.5)





