extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bar = get_node("HBoxContainer/Bars/LifeBar/Gauge")
onready var collected = get_node("HBoxContainer/Counters/Counter/Background/Number")
onready var player = get_node("../../../../")
onready var stage = player.get_node("../")

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.max_value = player.max_health
	stage.connect("collected_changed", self, "update_collected")

func _on_MainCharacter_health_changed(new_value):
	bar.value = new_value

func update_collected(new_value):
	collected.text = str(new_value)