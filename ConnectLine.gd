extends HBoxContainer

onready var chat = get_node("../..")

onready var input = get_node("TextInput")
onready var join_button = get_node("JoinButton")
onready var host_button = get_node("HostButton")

func _ready():
	input.text = IP.get_local_addresses()[1]
	join_button.connect("pressed", self, "_on_join_pressed")
	host_button.connect("pressed", self, "_on_host_pressed")

	input.connect("text_entered", self, "_on_text_entered")

func _on_join_pressed():
	_connect(input.text)

func _on_host_pressed():
	_create_server()

func _on_text_entered(text):
	_connect(text)

func _connect(ip_address):
	print("Connecting to ", ip_address)
	chat.connect_to_server(ip_address)

func _create_server():
	var addr = IP.get_local_addresses()[1]
	print("Creating server on ", addr)
	input.text = addr

	chat.create_server()
