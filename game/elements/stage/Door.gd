extends Node2D

@export var is_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale.x = 0.8

func open_door():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(3,1), 0.5)

func close_door():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.8,1), 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
