:england: [English version/Versão inglesa](README-en.md)
***

# Standaml [![CI](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml/badge.svg)](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml)
Classificação das tuas ligas preferidas de futebol no teu terminal

Fonte dos resultados: https://www.football-data.org

TODO: inserir exemplo básico aqui

## Configuração
TODO

### Token do football-data
Em primeiro lugar, o mais importante é registar-se no site do https://www.football-data.org e recuperar um token.
Uma vez recuperado, basta inseri-lo no ficheiro de configuração (`standaml.conf`) copiando o template (`standaml.default.conf`).

```bash
cp standaml.default.conf standaml.conf # copiar o template
vim standaml.conf # abrir o ficheiro de configuração com vim (ou outro) e inserir o token no lugar adequado
```

TODO: fazer um pequeno helper para pôr esse token automaticamente no ficheiro (e até copiar se for preciso), do tipo: dune exec standaml.exe config-token [TOKEN_HERE]

## Documentação
TODO

## Licença
ver [Licença MIT](LICENSE).
