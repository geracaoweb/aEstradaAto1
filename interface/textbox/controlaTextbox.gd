 #controla o fluxo da textbox: guardando as menssagens num vetor, limpando e passando a próxima menssagem ao apertar enter e acelerando caso seja segurada a teclada de skip

extends Control

#recebe o script TIE
onready var tie = get_parent().get_node("text_interface_engine")
onready var origemTextBox = get_parent().get_parent()

#variaveis relacionadas a aceleração
var velocidadeNormal = 0
var velocidadeAcelerada = 0.01
var acelerou = false #determina se o úsuario está acelerando o texto na menssagem atual, serve para impedir que ele mude de menssagem enquanto acelera

#variaveis de texto
onready var arrayMenssagens = [] #guarda as menssagens em sequencia
onready var arrayVelocidades = [] #guarda a velocidade de cada menssagem
onready var indiceAtualMenssagem = 0 #o indice atual da menssagem, usado para o looping de remoção e para imprimir
export var escrevendo = false #indica se a textBox está ativamente escrevendo algum texto

#variavel de controle de indice da historia
onready var adicionouIndiceHistoria = false


func comecarEscrever(): #comeca a escrever

	escrevendo = true
	adicionouIndiceHistoria = false
	#print("comecei")
	imprimeMenssagem(indiceAtualMenssagem)
	indiceAtualMenssagem += 1
	
func pararEscrever(): #para de escrever

	tie.reset()
	arrayMenssagens.clear()
	arrayVelocidades.clear()
	escrevendo = false
	indiceAtualMenssagem = 0
	if(adicionouIndiceHistoria == false):
	
		adicionouIndiceHistoria = true
		controleFluxoHistoria.acrescentaIndiceParte() #adiciona um ao indice da parte ao encerrar a exibição das menssagens

func adicionaMenssagem(menssagem,vel): #adiciona uma menssagem ao array de menssagens na posição i
	
	#print(menssagem)
	arrayMenssagens.append(str(menssagem))
	arrayVelocidades.append(vel)
	#print(arrayMenssagens.size())
	
func adicionaMenssagemEmocao(strMenssagem,intVel,strOrigem,strTipo,strEmocao,strVariacao): #adiciona menssagem e altera a emoção:
	
	origemTextBox.mudaOrigemTexto(strOrigem)
	origemTextBox.mudaTipoTexto(strTipo)
	origemTextBox.mudaEmocaoTexto(strEmocao)
	origemTextBox.mudaVariacaoTexto(strVariacao)
	arrayMenssagens.append(str(strMenssagem))
	arrayVelocidades.append(intVel)
	
func imprimeMenssagem(i): #imprime a menssagem da posição i no arrayMenssagem

	#print("imprimindo")
	#print(indiceAtualMenssagem)
	#print(arrayMenssagens[i])
	tie.buff_text(arrayMenssagens[i],arrayVelocidades[i])
	tie.set_state(tie.STATE_OUTPUT)
	#indiceAtualMenssagem += 1

func _ready():

	tie.reset()
	set_process(true)
	
func _process(delta):
	
	#print(tie.get_buffer())
	#mantem a velocidade normal atualizada
	#velocidadeNormal = tie.get_lastBufferSpeed()
	#print(tie.get_actualBufferSpeed())
	#print(indiceAtualMenssagem)
	#print(arrayMenssagens.size())
	
	if(escrevendo == false):
		
		get_parent().get_parent().hide()
		
	else:
		
		get_parent().get_parent().show()
	
	
	if(tie.get_buffer() != []):
		
		#acelera e desacelera a menssagem
		if(Input.is_action_pressed("passarMenssagem")):
				
			tie.set_buff_speed(velocidadeAcelerada)
			acelerou = true
			
		elif(acelerou == true):
			
			#print(indiceAtualMenssagem - 1)
			tie.set_buff_speed(arrayVelocidades[indiceAtualMenssagem - 1])
			acelerou = false

		#print(tie.get_buffer())
	elif(tie.get_buffer() == []):
		
		if(!Input.is_action_pressed("passarMenssagem") and acelerou == true):
			
			acelerou = false
		
		if(Input.is_action_pressed("passarMenssagem") and acelerou == false):
			
			#tie.reset()
			tie.clear_text()
			#tie.clear_buffer()
			#print(arrayMenssagens.size())
			#print(indiceAtualMenssagem + 1)
			if(arrayMenssagens.size() >= (indiceAtualMenssagem + 1)):
				
				#print("entrei")
				imprimeMenssagem(indiceAtualMenssagem)
				indiceAtualMenssagem += 1
				
			else:
				
				#print("fodasse")
				pararEscrever()
	
	
	
