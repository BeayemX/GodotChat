extends HBoxContainer

onready var send_button = get_node("SendButton")
onready var text_input = get_node("TextInput")

onready var chat = get_node("../..")

func _ready():
	send_button.connect("pressed", self, "_on_send_button_pressed")
	text_input.connect("text_changed", self, "_on_text_changed")
	text_input.connect("text_entered", self, "_on_text_entered")

	text_input.grab_focus()

func _on_text_changed(text):
	# _send(text)
	pass

func _on_text_entered(text):
	_send(text)

func _on_send_button_pressed():
	_send(text_input.text)

func _send(text):
	chat.send_message(text)
	text_input.text = ""
