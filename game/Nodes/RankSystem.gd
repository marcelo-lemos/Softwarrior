extends Node
#Should be edited for each stage
export(Dictionary) var time_spent = { S = 10, A = 20, B = 40, C = 60, D = 80}
export(Dictionary) var enemy_killed = { S = 20, A = 18, B = 14, C = 10, D = 5}
export(Dictionary) var items_collected = { S = 30, A = 25, B = 20, C = 15, D = 10}

var ranks = [StageData.ranks.E,StageData.ranks.D,StageData.ranks.C,StageData.ranks.B,StageData.ranks.A,StageData.ranks.S]

func _ready():
	print(get_rank(11,14,30))
func get_rank(time,enemy,item):
	var time_values = time_spent.values()
	var enemy_values = enemy_killed.values() 
	var item_values = items_collected.values()
	time_values.sort()
	enemy_values.sort()
	item_values.sort()
	
	var time_rank = time_values.size() - time_values.bsearch(time)
	var enemy_rank = enemy_values.bsearch(enemy,false)
	var item_rank = item_values.bsearch(item,false)
	print(time_rank)
	print(enemy_rank)
	print(item_rank)
	return ranks[int((time_rank + enemy_rank + item_rank)/3)]
	
	
