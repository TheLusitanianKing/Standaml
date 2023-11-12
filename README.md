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
# primeiras 5 equipas da Primeira Liga portuguesa (código: PPL)
dune exec standaml -- PPL -n 5
> Rank | Team                       | P  | W | D | L | GF | GA | GD | Points
> --------------------------------------------------------------------------
> 1    | Sporting Clube de Portugal | 10 | 9 | 1 | 0 | 22 | 9  | 13 | 28    
> 2    | Sport Lisboa e Benfica     | 10 | 8 | 1 | 1 | 21 | 8  | 13 | 25    
> 3    | FC Porto                   | 11 | 8 | 1 | 2 | 15 | 8  | 7  | 25    
> 4    | Sporting Clube de Braga    | 11 | 6 | 3 | 2 | 29 | 18 | 11 | 21    
> 5    | Moreirense FC              | 11 | 6 | 2 | 3 | 14 | 10 | 4  | 20  

# pode ver as diferentes opções
dune exec standaml -- --help
```

### Competições disponíveis
Pode encontrar uma lista de todas as competições no seguinte link: https://docs.football-data.org/general/v4/lookup_tables.html#_league_codes.
Verifica que a competição que deseja se encontra no seu plano.
O plano gratuito (tier one) dá acesso as competições principais, incluindo as seguintes:

* :portugal: PPL - Primeira Liga
* :england: PL - Premier League
* :fr: FL1 - Ligue 1
* :de: BL1 - Bundesliga
* :es: PD - La Liga (Primera División)
* :it: SA - Serie A 
* :netherlands: DED - Eredivisie
* :brazil: BSA - Brasileirão

Relembrando aqui que só funciona com competições em formato de liga.

## Futuras melhorias e bugs
Ver [Issues](https://github.com/TheLusitanianKing/Standaml/issues)

## Licença
ver [Licença MIT](LICENSE).
