# Full Cycle

## Desafio Nginx com Node.js Docker

Criar uma aplicação Node.js com acesso ao Mysql, sendo exposto através de um proxy reverso, o Nginx. Quando um usuário acessar o nginx, o mesmo fará uma chamada em nossa aplicação node.js. Essa aplicação por sua vez adicionará um registro em nosso banco de dados mysql, cadastrando um nome na tabela people. Ao executarmos o comando:

```bash
curl http://localhost:8080
```

Temos que ter o seguinte resultado:
```
- <h1>Full Cycle Rocks!</h1>

- Lista de nomes cadastrada no banco de dados.
```

## Executando a imagem gerada
```bash
docker-compose up -d
```