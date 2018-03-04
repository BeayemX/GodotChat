extends HBoxContainer

onready var chat = get_node("../..")

onready var input = get_node("UserNameInput")
onready var change_username_button = get_node("ChangeButton")

func _ready():
	change_username_button.connect("pressed", self, "_on_change_username_button_pressed")
	input.connect("text_entered", self, "_on_text_entered")

func _on_change_username_button_pressed():
	chat.change_username(input.text)

func _on_text_entered(text):
	chat.change_username(text)