# Changelog

## Como usar:

- lista de comandos

```bash
rake changelog:create                                     # Create release file
rake changelog:create:config[developer]                   # Create config file to store developer name
rake changelog:create:directory                           # Create directories
rake changelog:create:task[task,i18n]                     # Create file to describe the issue that is under development
rake changelog:delete:config                              # Delete config directory
rake changelog:delete:release                             # Delete release directory
rake changelog:delete:tasks                               # Delete tasks directory
rake changelog:index:task                                 # List all tasks
```

Use o comando **rake changelog:create:config[developer]** para criar um arquivo de configuração com seu nickname do gitlab

Esse comando só precisa ser utilizado se o arquivo **developer.yml** ainda não existir.

- Exemplo:

```bash
rake changelog:create:config["@dev_neomed"]
```
Use o comando **rake changelog:create:task[task,i18n]** para criar um arquivo que ira conter as informaçoes da sua issue.

- Exemplo:

```bash
rake changelog:create:task["TS-6666","Adicionamos nova funcionalidade"]
```

- Seguindo o exemplo um arquivo **TS-6666.yml** será criado.

```yml
issue: TS-6666
developer: @dev_neomed 
i18n: Adicionamos nova funcionalidade
```

## Como contribuir:

- Faça o download da gem
- Contribua da forma que puder :)
- Para certificar que sua contribuição não quebrou nenhuma configuração execute: **gem build neo_changelog.gemspec**
- Para instalar e testar a gem em sua marquina após efetuar a contribuição execute: **gem install ./neo_changelog-1.0.0.gem** 
