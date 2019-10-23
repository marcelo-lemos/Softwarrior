extends Node2D

onready var collectable_count = $Collectables.get_child_count()
var collected = 0

signal collected_changed

var respawn_position
var player_scene = preload("res://Nodes/Characters/Player/Player.tscn")
var player
var current_checkpoint 

func _ready():
	connect_collectables()
	connect_checkpoints()
	spawn_player()

func connect_collectables():
	connect_children($Collectables, "collected", "_on_Item_Collected")

func connect_checkpoints():
	connect_children($Checkpoints, "activate_checkpoint", "_on_Checkpoint_Activated")
	
func connect_children(parent, child_signal, method):
	for child in parent.get_children():
		child.connect(child_signal, self, method)
		
func _on_Item_Collected():
	collected += 1
	print("Itens collected: " + str(collected))
	emit_signal("collected_changed", collected)

func _on_Checkpoint_Activated(checkpoint):
	if current_checkpoint != null:
		current_checkpoint.deactivate()
	current_checkpoint = checkpoint
	player.respawn_position = checkpoint.respawn_position
	
func spawn_player():
	player = player_scene.instance()
	add_child(player)
	player.global_position = $PlayerSpawnPosition.global_position
	player.respawn_position = $PlayerSpawnPosition.global_position