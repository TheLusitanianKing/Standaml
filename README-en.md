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
cp standaml.default.conf standaml.conf # copiar o template
vim standaml.conf # abrir o ficheiro de configuração com vim (ou outro) e inserir o token no lugar adequado
```

## License
see [MIT License](LICENSE).
