#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')
simbolo='%'
relacao_memoria_formatado=${relacao_memoria_atual_total}${simbolo}

if [ $relacao_memoria_atual_total -gt 50 ]
then
	mail -a "From: email-rementente@outlook.com" -s "Consumo de memória acima do limite" glauciacastro.dev@gmail.com<<del
O consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }') que representa $relacao_memoria_formatado do total.
del

fi

# é interessante validar o que esta resultando das variaveis imprimindo elas a fim de confirmar que é o resultado esperado:

    # echo "Memória total: $memoria_total"
	# echo "Memória consumida: $memoria_consumida"
	# echo "Relação de memória atual/total: $relacao_memoria_atual_total"
	# echo "Relação de memória formatada: $relacao_memoria_formatado"

#também é possivel fazer a parte de envio de e-mail desta forma:
# echo -e "From: EMAILORIGEM-REMETENTE@outlook.com\nSubject: Consumo de memória acima do limite\n\nO consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }') que representa $relacao_memoria_formatado do total." | ssmtp EMAILDESTINO-destinatário@gmail.com
# no meu caso estou usando smtp configurado para o outlook e 
# por conta da configuração do smtp na minha maquina é necessário explicitar o from no cabeçalho.
# mas isso nem sempre é preciso a depender do serviço escolhido pra envio e da configuração.

#Lembrando que caso desejemos que o script rode automaticamente após determinado
# intervalo de tempo especificado, basta agendar uma tarefa através do crontab -e inserindo 
# o intervalo de tempo em que deseja que ele rode .