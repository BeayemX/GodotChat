extends RichTextLabel

# settings
var message_spacing = "    "

# caching
var last_user = ""
var last_time = ""

func _ready():
	Debug.register_as_target(self)

func handle_new_message(msg):
	var time = OS.get_datetime()
	var h = "%02d" % time["hour"]
	var m = "%02d" % time["minute"]
	# var s = "%02d" % time["second"]

	# time stuff
	var time_str =  "%s:%s" % [h, m]
	if last_time != time_str:
		text += "\n" + time_str

	# user stuff
	var new_user = msg["user"]
	if last_user != new_user:
		#text += "\n <<< " + new_user + " >>> "
		text += "\n\n" + new_user
		last_user = new_user

	# message stuff
	text += "\n" + message_spacing + msg["text"]
	last_time = time_str