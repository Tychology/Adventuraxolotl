extends Node

signal add_tim_tam


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_tim_tam_button_pressed():
	add_tim_tam.emit()
