extends TextureButton

signal switch_leader(Leader)

var leader

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_toggled(is_button_pressed):
	if is_button_pressed:
		switch_leader.emit(leader)
	else:
		set_pressed_no_signal(true)
