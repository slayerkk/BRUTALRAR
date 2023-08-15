# BRUTALRAR
<div align="center">
<img src="https://cdn.discordapp.com/attachments/1000154460808556675/1140992383354425357/e.png" width="515px" />
</div>

O BRUTALRAR é um script de linha de comando para gerar e testar senhas para arquivos RAR protegidos por senha. Ele é útil para tentar desbloquear arquivos RAR quando você não tem certeza da senha correta.

## Requisitos

- **bash**: O script foi projetado para ser executado em sistemas que suportam o shell bash.
- **unrar**: Você deve ter o utilitário `unrar` instalado para testar as senhas nos arquivos RAR.
- **lolcat**: Você deve ter o utilitário `lolcat` instalado para que o banner fique colorido.
## Uso

Execute o script da seguinte forma:

`chmod +x BrutalRAR.sh`

`./BrutalRAR.sh -i interesses -q quantidade -p arquivo.rar -f arquivo_ou_pasta -t tamanho_min,tamanho_max`

### Opções

- `-i interesses`: Lista de interesses para gerar senhas.
- `-q quantidade`: Número de senhas a serem geradas e testadas.
- `-p arquivo.rar`: Arquivo RAR protegido por senha.
- `-f arquivo_ou_pasta`: Arquivo ou pasta de destino para a descompactação.
- `-t tamanho_min,tamanho_max`: Tamanhos mínimo e máximo da senha.
- `-h`: Exibir mensagem de ajuda.

## Exemplo

Para gerar e testar 10 senhas com base em interesses como "gato,celular,moto", para um arquivo "arquivo.rar" protegido por senha, com tamanhos de senha variando de 8 a 16 caracteres, você pode usar o seguinte comando:

./BRUTALRAR.sh -i gato,celular,moto -q 10 -p arquivo.rar -f destino -t 8,16


## Atenção

Este script é fornecido como está e é para fins educacionais ou de teste. O uso indevido deste script pode violar as leis de privacidade e segurança. Use-o com responsabilidade e apenas em sistemas e arquivos que você tem permissão para acessar.

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).

<div align="center">
<h1>CONTATO</h1>
<a href="https://www.instagram.com/slayerkkk_/" target="_blank">
  <img src="https://cdn.discordapp.com/attachments/1000154460808556675/1089642850469294090/IMG_1953.png" width="100px">
</a>
<a href="https://discord.com/channels/@me/1000154460808556675" target="_blank">
  <img src="https://cdn.discordapp.com/attachments/1000154460808556675/1096626780191850496/discord-logo-1-1.png" width="100px">
</a>
</div>
