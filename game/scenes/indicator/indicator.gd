extends Sprite2D

@export var speed_rad:float = 2
@export var timer_sec = 0.3

func _ready():
	$Timer.wait_time = timer_sec

func _on_timer_timeout():
	rotate(speed_rad)
