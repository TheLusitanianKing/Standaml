:portugal: [Versão portuguesa/Portuguese version](README.md)
***

# Standaml [![CI](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml/badge.svg)](https://github.com/TheLusitanianKing/Standaml/actions/workflows/docker-image.yml)
Standing of your favorite football leagues in your terminal

Source of the results: https://www.football-data.org

## Configuration

### Football-data token
First step is registering at https://www.football-data.org and get your own API token. Once registered, you should receive the token in your email or get it through the site. 
Second step is putting the token in the config file (`standaml.conf`) that you should copy from the template (`standaml.default.conf`).

Example:
```bash
cp standaml.default.conf standaml.conf # copy the template config file
vim standaml.conf # open the file to fill it with your token
```

## Usage

```bash
# show first 5 teams in the English Premier League
dune exec standaml -- PL -n 5
> 1. P11 - Manchester City FC (27 pts) (28-8)
> 2. P11 - Tottenham Hotspur FC (26 pts) (23-13)
> 3. P11 - Arsenal FC (24 pts) (23-9)
> 4. P11 - Liverpool FC (24 pts) (24-10)
> 5. P11 - Aston Villa FC (22 pts) (26-16)

# you can check the different options
dune exec standaml -- --help
```

## Future features and bugs
see [Issues](https://github.com/TheLusitanianKing/Standaml/issues)

## License
see [MIT License](LICENSE).
