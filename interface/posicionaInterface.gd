 #posiciona os itens da interface

extends Control

#nodes
onready var origemTextbox = get_node("textBox")
onready var textBox = origemTextbox #uma variavel de nome alternativo, apenas para clareza do código

#origem do texto
var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

var estadoAnteriorCaixaIdeias = ""
var estadoAtualCaixaIdeias = ""

#variaveis vazias
	#textbox >
	
	#textbox narrador
var posTextbox = {} #margens do textbox

#textbox <

func _ready():
	
	centralizaTextBox()
	estadoAnteriorCaixaIdeias = controlaCaixaIdeias.getEstado()
	set_process(true)

func _process(delta):
	
	estadoAtualCaixaIdeias = controlaCaixaIdeias.getEstado()
	
	if(estadoAnteriorCaixaIdeias != estadoAtualCaixaIdeias):
		
		if(controlaCaixaIdeias.getEstado() == "aberta"):
			
			estadoAnteriorCaixaIdeias = controlaCaixaIdeias.getEstado()
			textBoxDireita()
			
		else:
		
			controlaCaixaIdeias.getEstado()
			centralizaTextBox()
		
func centralizaTextBox():
	
	#variaveis que determinam a área utilizavel da tela
	var alturaPadrao = encontraResolucao.getAlturaPadrao() #captura a altura padrao
	var larguraArea = encontraResolucao.getLarguraPadrao()
	var porcentagemTela = 0.65 #o quanto a área visivel do jogo ocupa a tela
	var alturaArea = alturaPadrao * porcentagemTela
	var diferencaAltura = alturaPadrao - alturaArea #calcula a diferença
	var parent = get_parent()
	
	#ajusta a a área utilizavel da tela
	set_size(Vector2(larguraArea,alturaArea))
	set_pos(Vector2(0,(diferencaAltura/2)))
	
	posTextbox = { #margens do textbox

	"anchorLeft" : ANCHOR_CENTER
	,"marginLeft" : (textBox.get_size().x/2)
	,"anchorRight" : ANCHOR_BEGIN
	,"marginRight" : 0
	,"anchorTop" : ANCHOR_BEGIN
	,"marginTop" : 50
	,"anchorBottom" : ANCHOR_BEGIN
	,"marginBottom" : 0
	}
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posTextbox["anchorLeft"],posTextbox["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextbox["anchorRight"],posTextbox["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posTextbox["anchorTop"],posTextbox["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextbox["anchorBottom"],posTextbox["marginBottom"])
	
func textBoxDireita():
	
	#variaveis que determinam a área utilizavel da tela
	var alturaPadrao = encontraResolucao.getAlturaPadrao() #captura a altura padrao
	var larguraArea = encontraResolucao.getLarguraPadrao()
	var porcentagemTela = 0.65 #o quanto a área visivel do jogo ocupa a tela
	var alturaArea = alturaPadrao * porcentagemTela
	var diferencaAltura = alturaPadrao - alturaArea #calcula a diferença
	var parent = get_parent()
	
	#ajusta a a área utilizavel da tela
	set_size(Vector2(larguraArea,alturaArea))
	set_pos(Vector2(0,(diferencaAltura/2)))
	
	posTextbox = { #margens do textbox

	"anchorLeft" : ANCHOR_CENTER
	,"marginLeft" : (textBox.get_size().x/2) - globais.getTamanhoCaixaIdeias().x/2 + 70
	,"anchorRight" : ANCHOR_BEGIN
	,"marginRight" : 0
	,"anchorTop" : ANCHOR_BEGIN
	,"marginTop" : 100
	,"anchorBottom" : ANCHOR_BEGIN
	,"marginBottom" : 0
	}
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posTextbox["anchorLeft"],posTextbox["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextbox["anchorRight"],posTextbox["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posTextbox["anchorTop"],posTextbox["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextbox["anchorBottom"],posTextbox["marginBottom"])