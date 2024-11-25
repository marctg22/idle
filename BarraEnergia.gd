extends HBoxContainer

@onready var timer_barra_energia: Timer = %Timer_BarraEnergia
@onready var progress_bar_barra_energia: ProgressBar = %ProgressBar_BarraEnergia
@onready var label_barra_energia: Label = %Label_BarraEnergia
@onready var label: Label = $Label
@onready var label_2: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var i = 0
var o = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
#	***************************************************************
#	contador segons
# 	sumem el valor delta que es la diferencia que pot donar segons el tipos d computadora
	i = i + delta
	label.text = "%s" %i
#	***************************************************************

	o = o-delta
	#label_2.text = "%s" %o
	
	if o <= 0.00:
		progress_bar_barra_energia.value +=1
		label_2.text = "%s" %o
		o=1
	



	#if timer_barra_energia.time_left <= 0.05:
	if timer_barra_energia.timeout:
		#progress_bar_barra_energia.value +=1
		print("out")
		print(progress_bar_barra_energia.value)
		

func _on_timer_timeout() -> void:
	pass # Replace with function body.
