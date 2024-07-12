#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $resposta_http

if [ $resposta_http -eq 200 ]
then
    echo "Tudo está ok com o servidor"
else
    echo "Houve um problema no servidor. Tentantando reinicializar"
    systemctl restart apache2
    echo "...Servidor reinicializando"
fi
