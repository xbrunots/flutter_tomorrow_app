https://youtu.be/yahAo6c4q5U

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/yahAo6c4q5U/0.jpg)](https://www.youtube.com/watch?v=yahAo6c4q5U)


---------



#### A API ADOTADA PARA A SOLUÇÃO FOI A https://api.tomorrow.io

---------

Afim de melhorar a experiência de uso, adicionei uma lista de seleção para alterar o Token de API,
Já que pode acontecer de acabar o limite de requisições, causando bloqueio de 1 hora.
Dentro da listagem de tokens existem 3 opções com 100% dos seus limites.

![img_10.png](img_10.png)

---------


## ATENÇÃO

### VSCode ou intellij idea

Antes de rodar o projeto adicione o argumento
```--dart-define-from-file=env.json``` em seu arquivo de execução

- Exemplo no intellij:
![img.png](img.png)

- Exemplo VSCode:
![img_7.png](img_7.png)

---------------

### Arquitetura/Padrões
Clean Architecture

Clean Code

SOLID

![img_1.png](img_1.png)
 
----------------

### Gerenciamento de Estado

Bloc/Cubit

#### EXISTEM 2 ABORDAGENS DE FLUXO DE ESTADOS 
- No Módulo **settings** você encontra a mais convencional onde emitimos 1 State para cada ação.
![img_8.png](img_8.png)

----------------

- Já no Módulo **home** utilizei uma abordagem que tem sido discutida em alguns foruns, um unico **state** concentra varias informações e é persistido

![img_9.png](img_9.png)
----------------

### Roteamento

Modular

----------------

### Testes
mocktail

flutter_test

bloc_test

----------------

### Cache
Todas as chamadas de API que trazem dados historicos onde não existe finalidade aparente de visualização em tempo real segue uma logica de cache dinamico



----------------

### Tooling
.env (Variaveis de ambiente)



----------------

### UI
Design System

Dark Mode 

Design Token

Lottie


Os componentes do Design System são reativos ao DarkMode, não necessitando de alteração pontuais.

---------------

- Exemplos Design Token **Text**:

![img_2.png](img_2.png)

![img_3.png](img_3.png)

---------------

- Exemplos Design Token **Button**:

![img_4.png](img_4.png)
![img_6.png](img_6.png)
