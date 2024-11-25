extends PanelContainer

# script BUTO_INICIAL  #############################



@onready var label: Label = $VBoxContainer/Label
@onready var timer: Timer = $Timer
@onready var check_box: CheckBox = $VBoxContainer/PanelContainer/CheckBox
@onready var color_rect: ColorRect = $VBoxContainer/PanelContainer/ColorRect

@onready var bateria: PanelContainer = %bateria
@onready var escaner: PanelContainer = %escaner

var butonActivat = false

var energiaInicial = 0
var maxEnergiaInicial = 10
var energiaInicialAumetClick = 1
var energiaInicialDescarga = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "0"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(timer.time_left)
	pass


func _on_button_pressed() -> void:
	timer.start()
	energiaInicial+=energiaInicialAumetClick
	label.text = "%s"%energiaInicial
	
	if energiaInicial >= maxEnergiaInicial:
#		buto_inicial ----------------------
		energiaInicial = 0
		#label.text = "%s"%energiaInicial
		check_box.button_pressed = true
		color_rect.color="ffffff"
#		bateria ---------------------------
		bateria.bateriaDescovert= true
		bateria.descobrir_bateria()
#		escaner ---------------------------
		escaner.escanerDescovert= true
		escaner.descobrir_escaner()
	
		pass # Replace with function body.


func _on_timer_timeout() -> void:
	
	if energiaInicial > 0:
		energiaInicial-=energiaInicialDescarga
		label.text = "%s"%energiaInicial
	else:
		timer.stop()
	pass # Replace with function body.
