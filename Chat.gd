extends Control

onready var messages = get_node("VBoxContainer/Messages")

var username = "UserName"

func on_new_message(msg):
	messages.handle_new_message(msg)

func send_message(text):
	# TODO send over network
	on_new_message({
		"user": username,
		"text" : text
	})

func change_username(new_name):
	username = new_name

func create_server():
	NetworkManager.create_server()

func connect_to_server(ip_address):
	NetworkManager.connect_to_server(ip_address)