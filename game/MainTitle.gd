extends Control

func list_from_directory(dir_name):
	var scenes_container = $VBoxContainer/Scenes
	
	for child in scenes_container.get_children():
		scenes_container.remove_child(child)


	var dir = DirAccess.open(dir_name)

	if not dir:
		return
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if file_name.ends_with('.tscn'):
			var go_button = Button.new()
			go_button.text = file_name
			go_button.pressed.connect(
				func(): return get_tree().change_scene_to_file(dir_name + file_name)
			)
			go_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			go_button.anchors_preset = go_button.PRESET_VCENTER_WIDE
			
			scenes_container.add_child(go_button)
			
		file_name = dir.get_next()

func level_pressed():
	list_from_directory("res://stages/")

func test_pressed():
	list_from_directory("res://test/stages/")
