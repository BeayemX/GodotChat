extends Control

onready var messages = get_node("VBoxContainer/Messages")

var username = "UserName"

func _ready():
	var userpath = OS.get_user_data_dir()

	# remove everything before first slash
	var pos = userpath.find("/")
	userpath = userpath.substr(pos+1, userpath.length() - pos)
	# remove /Users/ and /home/
	userpath = userpath.replacen("Users/", "").replacen("home/", "")
	# remove everything after next slash
	if userpath.find("/") > 0:
		userpath = userpath.substr(0, userpath.find("/"))
	if userpath: 
		username = userpath

sync func on_new_message(msg):
	messages.handle_new_message(msg)
	print(msg["user"], ": ", msg["text"])

func send_message(text):
	rpc("on_new_message", {
		"user": username,
		"text" : text
	})

func change_username(new_name):
	username = new_name

func create_server():
	NetworkManager.create_server()

func connect_to_server(ip_address):
	NetworkManager.connect_to_server(ip_address)
