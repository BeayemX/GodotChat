extends HBoxContainer

onready var chat = get_node("../..")

onready var input = get_node("UserNameInput")
onready var change_username_button = get_node("ChangeButton")

func _ready():
	change_username_button.connect("pressed", self, "_on_change_username_button_pressed")
	input.connect("text_entered", self, "_on_text_entered")
	
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
		input.text = userpath
		chat.change_username(input.text)

func _on_change_username_button_pressed():
	chat.change_username(input.text)

func _on_text_entered(text):
	chat.change_username(text)