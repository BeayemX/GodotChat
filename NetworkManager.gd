extends Node

var port = 55155
var max_players = 2

func _ready():
	get_tree().connect("network_peer_connected", self, "_on_network_peer_connected")
	get_tree().connect("network_peer_disconnected", self, "_on_network_peer_disconnected")
	get_tree().connect("connected_to_server", self, "_on_connected_to_server")
	get_tree().connect("connection_failed", self, "_on_connection_failed")
	get_tree().connect("server_disconnected", self, "_on_server_disconnected")
 # public interfac
func create_server():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(port, max_players)
	get_tree().set_network_peer(peer)

func connect_to_server(ip_address):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip_address, port)
	get_tree().set_network_peer(peer)

func terminate_network():
	get_tree().set_network_peer(null)


# callbacks

# called for every new player on every player
func _on_network_peer_connected(id):
	Debug.log_message("_on_network_peer_connected: " + str(id))
	#my_info["name"] = "Johnson Magenta"

func _on_network_peer_disconnected(id):
	Debug.log_message("_on_network_peer_disconnected: " + str(id))
	# connected_players.erase(id) # Erase player from info

# Only called on clients, not server. Send my ID and info to all the other peers
func _on_connected_to_server():
	Debug.log_message("_on_connected_to_server")

func _on_connection_failed():
	Debug.log_message("_on_connection_failed")
	pass # Could not even connect to server, abort

func _on_server_disconnected():
	Debug.log_message("_on_server_disconnected")
	pass # Server kicked us, show error and abort
