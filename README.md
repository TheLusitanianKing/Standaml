:england: [English version/Versão inglesa](README-en.md)
***

# Standaml [![CI](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml/badge.svg)](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml)
Classificação das tuas ligas preferidas de futebol no teu terminal

Fonte dos resultados: https://www.football-data.org

## Configuração

### Token do football-data
Em primeiro lugar, precisa registar-se no site do https://www.football-data.org e recuperar um token. Uma vez inscrito deverá recebê-lo por email ou pelo site.
Uma vez recuperado, basta inseri-lo no ficheiro de configuração (`standaml.conf`) copiando o template (`standaml.default.conf`).

Examplo:
```bash
cp standaml.default.conf standaml.conf # copiar o template
vim standaml.conf # abrir o ficheiro de configuração com vim (ou outro) e inserir o token no lugar adequado
```

## Uso

```bash
# primeiras 10 equipas da Primeira Liga portuguesa
dune exec standaml -- PPL -n 5
> 1. P10 - Sporting Clube de Portugal (28 pts) (22-9)
> 2. P10 - Sport Lisboa e Benfica (25 pts) (21-8)
> 3. P10 - FC Porto (22 pts) (13-7)
> 4. P10 - Sporting Clube de Braga (20 pts) (29-18)
> 5. P10 - Vitória SC (19 pts) (17-11)

# pode ver as diferentes opções
dune exec standaml -- --help
```

## Licença
ver [Licença MIT](LICENSE).
