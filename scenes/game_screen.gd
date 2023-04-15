extends Control

var leader_button_scene = preload("res://scenes/leader_button.tscn")

@onready var leftPanel : LeftPanel = $LeftPanel


var current_leader

# Called when the node enters the scene tree for the first time.
func _ready():
	for leader in LeadersData.leaders:
		add_leader_art(leader)
		add_leader_button(leader)
		
	_switch_leader(Leader.Leaders.AXOLOTL)



func _switch_leader(leader):
	for textureRect in $LeaderArts.get_children():
		if textureRect.get_meta("leader") == leader:
			textureRect.visible = true
		else:
			textureRect.visible = false
	for button in $LeaderSelect/VBox.get_children():
		if button.leader == leader:
			button.set_pressed_no_signal(true)
		else:
			button.set_pressed_no_signal(false)
	current_leader = leader
	leftPanel.ChangeLeader(leader)
	


func add_leader_art(leader):
	var textureRect = TextureRect.new()
	var texture = load(LeadersData.leaders[leader]["art"])
	assert(texture != null)
	
	textureRect.set_meta("leader", leader)
	textureRect.set_texture(texture)
	textureRect.size =  get_viewport_rect().size
	textureRect.name = LeadersData.leaders[leader]["name"]
	$LeaderArts.add_child(textureRect)

func add_leader_button(leader):
	var button = leader_button_scene.instantiate()
	var icon = load(LeadersData.leaders[leader]["icon"])
	assert(icon != null)
	
	button.leader = leader
	button.get_child(0).set_texture(icon)
	$LeaderSelect/VBox.add_child(button)
	$LeaderSelect/VBox.get_child(-1).switch_leader.connect(_switch_leader)
