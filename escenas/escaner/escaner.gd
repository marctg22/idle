extends PanelContainer

# script ESCANER #############################

@onready var color_rect: ColorRect = $MarginContainer/VBoxContainer/PanelContainer/ColorRect
@onready var check_box: CheckBox = $MarginContainer/VBoxContainer/PanelContainer/CheckBox

var escanerDescovert = false
var escanerConectat = false

# energia per activar escaner
var totalEnergia = 10
var sumaEnergiaInicial = 0
var descargaInicial = 0.05
var escanerActivat = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#	-----------------------------------------------------------------------------


#	-----------------------------------------------------------------------------
#	DESCOBRIR escaner
func descobrir_escaner()->void:
	if escanerDescovert:
		color_rect.color = "ffffff"
		check_box.disabled = false


#	-----------------------------------------------------------------------------
#	CONECTAR escaner
func conectar_escaner()->void:
	escanerConectat = true
	check_box.button_pressed = true
	pass

#	-----------------------------------------------------------------------------
