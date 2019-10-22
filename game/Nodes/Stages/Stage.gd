extends Node2D

onready var collectable_count = $Collectables.get_child_count()
var collected = 0
func _ready():
	connect_collectables()

func connect_collectables():
	for child in $Collectables.get_children():
		child.connect("collected",self,"_on_Item_Collected")

func _on_Item_Collected():
	collected += 1
	print("Itens collected: " + str(collected))