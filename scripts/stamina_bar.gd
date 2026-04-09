extends Control

@onready var staminaBar = $StaminaProgressBar

var exhausted = true
var exhaust_buffer = 1.5
var stamina_timer = 0
var can_start_timer = true

func _ready():
	staminaBar.value = 100.0

func _process(delta: float) -> void:
	if exhausted == false && staminaBar.value != 100 or staminaBar.value == 0:
		can_start_timer = true
		if can_start_timer:
			stamina_timer += delta
			if stamina_timer >= exhaust_buffer:
				exhausted = true
				can_start_timer = false
				stamina_timer = 0
	if staminaBar.value == 100:
		exhausted = false
	if exhausted == true:
		staminaBar.value += .5
