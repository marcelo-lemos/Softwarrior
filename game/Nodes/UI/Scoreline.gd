	extends HBoxContainer
class_name Scoreline
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var centered_text = "[center]%s[/center]"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_score(rank,score_name,score,stage):
	$Rank.text = str(rank)
	$Name.bbcode_text = "[center]%s[/center]" % str(score_name)
	$Score.bbcode_text = "[center]%s[/center]" % str(score)
	$Stage.bbcode_text = "[center]%s[/center]" % str(stage)
