extends Control

@export
var next_scene: PackedScene

func _on_button_start_button_up():
	get_tree().change_scene_to_packed(next_scene)
