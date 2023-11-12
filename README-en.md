:portugal: [Versão portuguesa/Portuguese version](README.md)
***

# Standaml [![CI](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml/badge.svg)](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml)
Standing of your favorite football leagues in your terminal

Source of the results: https://www.football-data.org

## Configuration

### Football-data token
First step is registering at https://www.football-data.org and get your own API token. Once registered, you should receive the token by email or get it through the site. 
Second step is putting the token in the config file (`standaml.conf`) that you should copy from the template (`standaml.default.conf`).

Example:
```bash
cp standaml.default.conf standaml.conf # copy the template config file
vim standaml.conf # open the file to fill it with your token
```

## Usage

```bash
# show first 5 teams in the English Premier League (code: PL)
dune exec standaml -- PL -n 5
> Rank | Team                 | P  | W | D | L | GF | GA | GD | Points
> --------------------------------------------------------------------
> 1    | Manchester City FC   | 12 | 9 | 1 | 2 | 32 | 12 | 20 | 28    
> 2    | Liverpool FC         | 12 | 8 | 3 | 1 | 27 | 10 | 17 | 27    
> 3    | Arsenal FC           | 12 | 8 | 3 | 1 | 26 | 10 | 16 | 27    
> 4    | Tottenham Hotspur FC | 12 | 8 | 2 | 2 | 24 | 15 | 9  | 26    
> 5    | Aston Villa FC       | 12 | 8 | 1 | 3 | 29 | 17 | 12 | 25

# you can check the different options
dune exec standaml -- --help
```

### Available competitions
You can check the list of all the competitions at https://docs.football-data.org/general/v4/lookup_tables.html#_league_codes.
Just make sure they're in your tier subscription plan.
The free plan (tier one) gives access to the major competitions, to name only a few:

* :england: PL - Premier League
* :portugal: PPL - Primeira Liga
* :fr: FL1 - Ligue 1
* :de: BL1 - Bundesliga
* :es: PD - La Liga (Primera División)
* :it: SA - Serie A 
* :netherlands: DED - Eredivisie

Side note to remind that it will only work with competitions with a league format.

## Future features and bugs
see [Issues](https://github.com/TheLusitanianKing/Standaml/issues)

## License
see [MIT License](LICENSE).
