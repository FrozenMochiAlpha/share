extends Control
@export var weed_button: Button
@export var hydroid: Label
@export var weed_sound: AudioStreamPlayer

var smoke_counter: int = 0
var cooldown = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text()


func set_text():
	hydroid.text = "Weed Smoked: " + str(smoke_counter)

func _on_button_button_down() -> void:
	if cooldown:
		return
	cooldown = true
	smoke_counter += 1
	set_text()
	weed_sound.play(0.0)
	await get_tree().create_timer(0.6).timeout
	cooldown = false
