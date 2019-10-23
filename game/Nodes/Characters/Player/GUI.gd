extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bar = get_node("HBoxContainer/Bars/LifeBar/Gauge")
onready var player = get_node("../../../../")

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_max_health = player.max_health
	bar.max_value = player_max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainCharacter_health_changed(new_value):
	bar.value = new_value
