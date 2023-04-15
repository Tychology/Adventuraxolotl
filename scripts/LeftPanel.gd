extends Control
class_name LeftPanel

@onready var nameLabel = $NameLabel
@onready var titleLabel = $TitleLabel
@onready var logo = $Logo
@onready var dialogue = $Dialogue

@onready var option1 = $Option1
@onready var option2 = $Option2
@onready var option3 = $Option3



var dialogue_resource = preload("res://dialogue/starter.dialogue")

var dialogue_line : DialogueLine

func ChangeLeader(leader : Leader.Leaders):
	nameLabel.text = LeadersData.leaders[leader].name
	titleLabel.text = LeadersData.leaders[leader].state
	logo.texture = load(LeadersData.leaders[leader].icon)

func _ready():
	Dialogue("starter")

func Dialogue(id : String):
	dialogue_line = await dialogue_resource.get_next_dialogue_line(id)
	dialogue.dialogue_line = dialogue_line
	dialogue.type_out()
	option1.disabled = false
	option1.label.text = "Continue"
	option2.disabled = true
	option2.label.text = ""
	option3.disabled = true
	option3.label.text = ""
	
	if dialogue_line.responses.size() > 0:
		option1.disabled = false
		option1.label.text = dialogue_line.responses[0].text
		if dialogue_line.responses.size() > 1:
			option2.disabled = false
			option2.label.text = dialogue_line.responses[1].text
			if dialogue_line.responses.size() > 2:
				option3.disabled = false
				option3.label.text = dialogue_line.responses[2].text


func _on_option_1_pressed():
	if dialogue_line.responses.size() > 0:
		Dialogue(dialogue_line.responses[0].next_id)
	else:
		Dialogue(dialogue_line.next_id)


func _on_option_2_pressed():
	if dialogue_line.responses.size() > 1:
		Dialogue(dialogue_line.responses[1].next_id)
	else:
		Dialogue(dialogue_line.next_id)


func _on_option_3_pressed():
	if dialogue_line.responses.size() > 2:
		Dialogue(dialogue_line.responses[2].next_id)
	else:
		Dialogue(dialogue_line.next_id)
