extends Control

func _ready():
	add_to_group("NameInput")


func _on_texture_button_pressed():
	visible = false
	EventMaster.EndEvent()
