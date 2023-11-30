extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = DirAccess.open("res://test/stages")
	var scenes_container = $VBoxContainer/ScrollContainer/Scenes
	if not dir:
		return
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if file_name.ends_with('.tscn'):
			var go_button = Button.new()
			go_button.text = file_name
			go_button.pressed.connect(
				func(): return get_tree().change_scene_to_file("res://test/stages/" + file_name)
			)
			
			scenes_container.add_child(go_button)
			
		file_name = dir.get_next()


	
