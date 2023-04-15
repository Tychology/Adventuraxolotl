extends TextureButton

@onready var label = $Label

var glowing = false
var tweener : Tween


func _process(_delta):
	if not disabled:
		if not glowing && is_hovered():
			if tweener != null:
				tweener.kill()
			tweener = create_tween()
			tweener.tween_property(self,"self_modulate",Color("f2f2f2"),1.)
			glowing = true
		if not is_hovered() && glowing:
			if tweener != null:
				tweener.kill()
			tweener = create_tween()
			glowing = false
			tweener.tween_property(self,"self_modulate",Color("bfbfbf"),0.5)
	elif glowing:
		if tweener != null:
			tweener.kill()
		glowing = false
		tweener = create_tween()
		tweener.tween_property(self,"self_modulate",Color("bfbfbf"),0.5)
