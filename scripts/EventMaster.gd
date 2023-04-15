extends Node

var left_panel : LeftPanel


func _ready():
	if has_node("/root/Main/GameScreen/LeftPanel"):
		left_panel = get_node("/root/Main/GameScreen/LeftPanel")

func InputName() -> void:
	Event()
	for name_input in get_tree().get_nodes_in_group("NameInput"):
		name_input.visible = true

func Event():
	for option in get_tree().get_nodes_in_group("Option"):
		option.disabled = true

func EndEvent():
	left_panel.Dialogue(left_panel.dialogue_line.next_id)
