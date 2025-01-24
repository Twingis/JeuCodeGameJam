extends ProgressBar

@onready var health_bar: ProgressBar = $"."
var health := 0

func init_health(curr_health) :
	health = curr_health
	
	
