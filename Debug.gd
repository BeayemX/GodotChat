extends Node

var _message_target

func register_as_target(target):
	_message_target = target

func log_message(msg_text):
	_message_target.text += "\n D E B U G --> " + msg_text