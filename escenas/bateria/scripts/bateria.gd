extends PanelContainer

# script BATERIA #############################



var bateriaDescovert = false
var bateriaConectada = false

# energia per activar bateria
var totalEnergia = 10
var sumaEnergiaInicial = 0
var descargaInicial = 0.05
var bateriaActivada = false

# energia de la bateria
var maxEnergiaBateria = 30
var sumaEnergiaBateria = 0
var descargaBateria = 0.50


#---------------------------------
@onready var color_rect: ColorRect = $MarginContainer/VBoxContainer/PanelContainer/ColorRect
@onready var check_box: CheckBox = $MarginContainer/VBoxContainer/PanelContainer/CheckBox
#---------------------------------
@onready var check_button: CheckButton = $MarginContainer/VBoxContainer/CheckButton
#---------------------------------
@onready var progress_bar: ProgressBar = $MarginContainer/VBoxContainer/ProgressBar
#---------------------------------
@onready var button: Button = $MarginContainer/VBoxContainer/Button
#---------------------------------
@onready var label_energia_inicial: Label = $MarginContainer/VBoxContainer/Label_Energia_Inicial
#---------------------------------
@onready var label_energia_bateria: Label = $MarginContainer/VBoxContainer/Label_Energia_Bateria
#---------------------------------
@onready var label_descarga_bateria: Label = $MarginContainer/VBoxContainer/Label_Descarga_Bateria
#---------------------------------
@onready var timer: Timer = $MarginContainer/VBoxContainer/Timer
#---------------------------------

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.max_value = maxEnergiaBateria
	label_descarga_bateria.text = "-%s"%descargaBateria
	button.disabled = true
	pass # Replace with function body.



#	-----------------------------------------------------------------------------
func _process(delta: float) -> void:
	
	#if sumaEnergiaInicial >= totalEnergia:
		#bateriaActivada = true
		
	pass
	
#	-----------------------------------------------------------------------------
#	BTN per afegir energia inicial i carregar la bateria manualment si esta activada
func _on_button_pressed() -> void:
	
	if bateriaActivada and not check_button.button_pressed:
		pass
	else:
#	activa el timer	
		timer.start()


#	si no tenim activada la bateria	
	if not bateriaActivada:
#		afegeig un punt a la energia
		sumaEnergiaInicial +=1
		label_energia_inicial.text = "%s" %sumaEnergiaInicial
#	-----------------------------------------------------------------------------
#	si la energia incial es igual o superior al requeriment per activar la bateria
#   queda activat el check btn per poder activar la bateria i poder carregar-la
		if sumaEnergiaInicial >= totalEnergia:
			bateriaActivada = true
			check_button.disabled = false
			button.disabled = false
#	-----------------------------------------------------------------------------

#	si la bateria esta ACTIVADA i el check button esta ON
#	sumem els punt per click directament a la barra de la bateria
	if check_button.button_pressed:
		if sumaEnergiaBateria +1 < maxEnergiaBateria:
			sumaEnergiaBateria += 1
			progress_bar.value = sumaEnergiaBateria
			label_energia_bateria.text = "%s"%sumaEnergiaBateria
		else:
			sumaEnergiaBateria >= maxEnergiaBateria
			progress_bar.value = maxEnergiaBateria
			label_energia_bateria.text = "%s"%maxEnergiaBateria
	

#	-----------------------------------------------------------------------------
func _on_timer_timeout() -> void:

#	si la bateria NO esta ACTIVA :	
#	cada segon resta el valor de "descargaInicial" a la energia inicial
	if not bateriaActivada:
		if sumaEnergiaInicial > 0:
			sumaEnergiaInicial -= descargaInicial
			label_energia_inicial.text = "%s"%sumaEnergiaInicial
		elif sumaEnergiaInicial <=0:
			timer.stop()
			label_energia_inicial.text = "0"
#	-----------------------------------------------------------------------------
#	si la bateria SI esta ACTIVA :	
#	cada segon resta el valor de "descargaBateria" a la bateria
	if bateriaActivada:
		if sumaEnergiaBateria > 0:
			sumaEnergiaBateria -= descargaBateria
			progress_bar.value = sumaEnergiaBateria
			label_energia_bateria.text = "%s"%sumaEnergiaBateria
		elif sumaEnergiaBateria <=0:
			timer.stop()
			progress_bar.value = 0
			label_energia_bateria.text = "0"

#	-----------------------------------------------------------------------------
#	ON/OFF check_BTN per la bateria
func _on_check_button_pressed() -> void:
	#print(check_button.disabled)
	if check_button.button_pressed:
		activar_check_button_bateria()
	elif not check_button.button_pressed:
		desactivar_check_button_bateria()
#	-----------------------------------------------------------------------------

		
#	-----------------------------------------------------------------------------
#	activa la bateria
func activar_check_button_bateria() -> void:
	check_button.button_pressed = true
	check_button.text = "On"
#	-----------------------------------------------------------------------------
	
#	-----------------------------------------------------------------------------
#	desactiva la bateria
func desactivar_check_button_bateria() -> void:
	check_button.button_pressed = false
	check_button.text = "Off"
#	-----------------------------------------------------------------------------

#	-----------------------------------------------------------------------------
#	DESCOBRIR bateria
func descobrir_bateria()->void:
	if bateriaDescovert:
		color_rect.color = "ffffff"
		check_box.disabled = false
#	-----------------------------------------------------------------------------



#	-----------------------------------------------------------------------------
#	CONECTAR bateria
func _on_check_box_pressed() -> void:
	bateriaConectada = true
	pass # Replace with function body.

#	-----------------------------------------------------------------------------
