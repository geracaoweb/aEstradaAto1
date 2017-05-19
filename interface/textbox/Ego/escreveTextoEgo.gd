#cria o texto do ego

extends Control

var egoPrimeiraDistracao = false setget ,getEgoPrimeiraDistracao #determina se o ego já termino de falar sobre a primeira distracao

onready var tie = get_parent().get_node("text_interface_engine")
onready var controlaTextbox = get_parent().get_node("controlaTextbox")
onready var origemTextbox = get_parent().get_parent() #pega o nó textbox
export var velocidadePadrao = 0.05 #velocidade padrão dessa fonte de texto
var parteAtual = ""
var indiceAtual = 0

#parte = "estradaPrincipal"
var indiceTextoEstradaPrincipal = 0
var indiceTextoEstradaPrincipalAnterior = -1
var intervaloPassosEstradaPrincipal = 8.0 #determina o valor do intervalo de passos
var emocaoAtualEstradaPrincipal = "" #determina qual será a emoção de certo texto
var menssagemAtualEstradaPrincipal = "" #determina qual será a menssagem
var totalTextoEstradaPrincipal = 22 #determina o número máximo de textos na estrada principal
#var parteAnterior = "" #garante que o evento não fique em loop
#var indiceAnterior = 0 #garante que o evento não fique em loop
#var configurou = false #garante que o evento não fique em loop

func _ready():
	
	#inicializa
	tie.reset()
	
	set_process(true)

func _process(delta): #ao ser chamado esse texto escreve automaticamente a narrativa
	
	#atualiza a parte e o indice da parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceAtual = controleFluxoHistoria.getIndiceParte()
	
	if(parteAtual == "prologo"): #textos do prologo
			
		#escreve o texto
		
		if(indiceAtual == 9):
			
			#determina a textbox
			origemTextbox.mudaOrigemTexto("ego")
			origemTextbox.mudaTipoTexto("pensamento")
			origemTextbox.mudaEmocaoTexto("pensativo")
			origemTextbox.mudaVariacaoTexto("")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO1"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 13):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#impede qualquer outra interação além do texto
			#controleFluxoHistoria.setExclusivoTexto(true)
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO2"),velocidadePadrao)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO3"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			#controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias", false)
			
		elif(controleFluxoHistoria.getIndiceParte() == 19):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("triste")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO4"),velocidadePadrao)
			#controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO5"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
		elif(controleFluxoHistoria.getIndiceParte() == 21):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO5"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
		elif(controleFluxoHistoria.getIndiceParte() == 26):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("pensativo")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO6"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 29):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("triste")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO7"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
#			#print("vai falar")
#			#print(controleFluxoHistoria.getIndiceParte())
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
#			#print("falando")
#			#print(controleFluxoHistoria.getIndiceParte())
			
		elif(controleFluxoHistoria.getIndiceParte() == 32):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO8"),velocidadePadrao)
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 35):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("raiva")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO9"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 38):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("pensativo")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO10"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 41):
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO11"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 46):
				
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO12"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 48):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("pensativo")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO13"),velocidadePadrao)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO14"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 52):
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO15"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 56):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO16"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 60):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("triste")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO17"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 63):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO18"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 67):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("pensativo")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO19"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 72):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("feliz")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO20"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 75):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("raiva")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO21"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 80):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("pensativo")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO22"),velocidadePadrao)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO23"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 82):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("confiante")
			
			#escreve o texto
			controleFluxoHistoria.setExclusivoTexto(true)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO24"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
	elif(controleFluxoHistoria.getParte() == "estradaPrincipal" and indiceTextoEstradaPrincipal <= totalTextoEstradaPrincipal): #texto normal da estrada
		
		#aqui vai ocorrer um encadeado de ifs baseado nos passos do Ego
		#sempre num intervalo de 8 passos
		#como o texto está automático, é mais simples somente mudar as emoção
		indiceTextoEstradaPrincipal = (globais.getPassosSupostos())/intervaloPassosEstradaPrincipal #determina o indice atual de passos
		
		#print(indiceTextoEstradaPrincipal)
		
		#muda as emoções dependendo do índice  na estrada principal
		if(controleFluxoHistoria.getIndiceParte() == 0):
			
			emocaoAtualEstradaPrincipal = "pensativo"
			
		elif(controleFluxoHistoria.getIndiceParte() == 1):
			
			emocaoAtualEstradaPrincipal = "feliz"
			
		elif(controleFluxoHistoria.getIndiceParte() == 2):
			
			emocaoAtualEstradaPrincipal = "confiante"
			
		elif(controleFluxoHistoria.getIndiceParte() == 5):
			
			emocaoAtualEstradaPrincipal = "triste"
			
		elif(controleFluxoHistoria.getIndiceParte() == 12):
			
			emocaoAtualEstradaPrincipal = "raiva"
			
		elif(controleFluxoHistoria.getIndiceParte() == 17):
			
			emocaoAtualEstradaPrincipal = "triste"
			
		origemTextbox.mudaEmocaoTexto(emocaoAtualEstradaPrincipal)
		
		if(fmod(globais.getPassosSupostos(),intervaloPassosEstradaPrincipal) == 0 and indiceTextoEstradaPrincipal > 0 and indiceTextoEstradaPrincipal != indiceTextoEstradaPrincipalAnterior): #desse modo a cada n passos escreverá um texto
			
			#determina a menssagem num processo automatizado
			menssagemAtualEstradaPrincipal = tr("EGO_ESTRADA_PRINCIPAL" + str(indiceTextoEstradaPrincipal)) #determina menssagem, automático
			
			#adiciona a menssagem
			controlaTextbox.adicionaMenssagemEmocao(menssagemAtualEstradaPrincipal,velocidadePadrao,"ego","pensamento",emocaoAtualEstradaPrincipal,"nenhuma")
			
			if(controlaTextbox.getEscrevendo() == false):
				
				controlaTextbox.comecarEscrever()
				indiceTextoEstradaPrincipalAnterior = indiceTextoEstradaPrincipal
				
			else:
				
				indiceTextoEstradaPrincipalAnterior = indiceTextoEstradaPrincipal
	elif(controleFluxoHistoria.getParte() == "exaustao"):
		
		if(controleFluxoHistoria.getParte() == 1):
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("triste")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_EXAUSTAO1"),velocidadePadrao)
			controlaTextbox.adicionaMenssagem(tr("EGO_EXAUSTAO2"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
	elif(controleFluxoHistoria.getParte() == "reflexao"):
		
		if(controleFluxoHistoria.getIndiceParte() == 0):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("triste")
			
			#escreve o texto
#			controlaTextbox.adicionaMenssagem(tr("EGO_REFLEXAO1"),velocidadePadrao)
#			controlaTextbox.adicionaMenssagem(tr("EGO_REFLEXAO2"),velocidadePadrao)
#			controlaTextbox.adicionaMenssagem(tr("EGO_REFLEXAO3"),velocidadePadrao)
#			controlaTextbox.adicionaMenssagem(tr("EGO_REFLEXAO4"),velocidadePadrao)
			controlaTextbox.adicionaMenssagemIntervalo("EGO_REFLEXAO",1,4,velocidadePadrao) #adiciona as 4 primeiras menssagens
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getParte() == 4):
			
			controlaTextbox.adicionaMenssagemIntervalo("EGO_REFLEXAO",1,4,velocidadePadrao) #adiciona as 4 primeiras menssagens
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
	elif(controleFluxoHistoria.getParte() == "queda"):
		
		pass
		
func textoNaoSonho():
	
	var comecouEscrever = false
	
	
	
	if(comecouEscrever == false):
		
		#muda a emoção
		origemTextbox.mudaEmocaoTexto("pensativo")
		
		#escreve o texto
		controleFluxoHistoria.setExclusivoTexto(true)
		controlaTextbox.adicionaMenssagem(tr("EGO_NAOSONHO"),velocidadePadrao)
		
		controlaTextbox.comecarEscreverSemIndice("naoSonho")
		comecouEscrever == true
#	controleFluxoHistoria.acrescentaIndiceParte(get_name())

func primeiraDistracao():
	
	var comecouEscrever = false
	
	if(comecouEscrever == false):
		
	
		#muda a emoção
		origemTextbox.mudaEmocaoTexto("pensativo")
		
		#escreve o texto
		controleFluxoHistoria.setExclusivoTexto(true)
		controlaTextbox.adicionaMenssagem(tr("EGO_PRIMEIRA_DISTRACAO1"),velocidadePadrao)
		controlaTextbox.adicionaMenssagem(tr("EGO_PRIMEIRA_DISTRACAO2"),velocidadePadrao)
		controlaTextbox.adicionaMenssagem(tr("EGO_PRIMEIRA_DISTRACAO3"),velocidadePadrao)
		
		controlaTextbox.comecarEscreverSemIndice("primeiraDistracao")
		comecouEscrever == true
#	controleFluxoHistoria.acrescentaIndiceParte(get_name())

func getEgoPrimeiraDistracao():
	
	return egoPrimeiraDistracao