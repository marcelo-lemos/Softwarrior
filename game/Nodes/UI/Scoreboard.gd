extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ID_FIELD = "id"
const LEVEL_FIELD = "levelId"
const NAME_FIELD = "name"
const SCORE_FIELD = "scoreValue"

var score_line_scene = preload("res://Nodes/UI/Scoreline.tscn")
onready var score_container = $MainPanel/VBoxContainer2/Panel/MarginContainer/ScrollContainer/ScoreContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GetRequest_request_completed(result, response_code, headers, body):
	clear_scores()
	var json = JSON.parse(body.get_string_from_utf8())
	var score_list = json.result
	var rank = 1
	for score in score_list:
		print(score)
		add_score_line(rank,score)
		rank += 1

func clear_scores():
	for child in score_container.get_children():
		child.queue_free()

func add_score_line(rank,score_dict):
	var score_line = score_line_scene.instance()
	score_line.set_score(rank,score_dict[NAME_FIELD],score_dict[SCORE_FIELD],score_dict[LEVEL_FIELD])
	score_container.add_child(score_line)

func add_score(name,score_value,stage):
	var score_obj = {}
	score_obj[ID_FIELD] = str(OS.get_system_time_msecs ()) + str(abs(randi()%100)) #RandomID
	score_obj[NAME_FIELD] = name
	score_obj[SCORE_FIELD] = score_value
	score_obj[LEVEL_FIELD] = stage
	send_new_score(score_obj)
	
func get_top_n_scores(n):
	$GetRequest.request("http://localhost:8080/score/1?top=" + str(n))

func send_new_score(score_obj):
	var query = JSON.print(score_obj)
    # Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	var url = "http://localhost:8080/score"
	$PostRequest.request(url, headers, true, HTTPClient.METHOD_POST, query)

func get_top_scores():
	get_top_n_scores(100)
	
func _on_Button_pressed():
	get_top_n_scores(10)


func _on_Button2_pressed():
	add_score("TestBro", randi(), 1)
	pass # Replace with function body.
