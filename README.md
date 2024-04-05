## **Teste Técnico**

Esse repositório tem uma estrutura bastante semelhante a um dos nossos aplicativos. Usamos ele em nosso processo seletivo para entendermos um pouco mais sobre o modo de trabalho das pessoas participantes, assim como é uma boa maneira das pessoas conhecerem um pouco mais da maturidade técnica de nossa equipe também.

Esse repositório é privado e pedimos para que o matenha assim, por favor ;)

### Expectativa
- Queremos avaliar seu modo de trabalho. Então, fique à vontade e considere esse repositório como seu.
- O escopo do projeto é livre, ou seja, fica a critério da pessoa participante decidir as funcionalidades que ela entende como relevante e implementa-las.
- Similiarmente, a parte de interface gráfica, assim como a UX é de responsabilidade da pessoa participante.
- A pessoa participante pode abrir um ou mais pull request(s) ou trabalhar em uma branch especifica que ela desejar.

### Avaliação

Levaremos em conta:
- Familiaridade da pessoa com as APIs em flutter
- A implementação de novas funcionalidades ou alterações feita no teste 
- A experiência final do aplicativo
- A legibilidade e se e como as boas práticas foram aplicadas no código


### Encerramento
Assim que o prazo terminar, você deixará de ser colaborador. A partir disso, analisaremos e entraremos em contato com o resultado.

Abaixo seguem outras informações técnicas sobre o repositório.

Te desejamos boa sorte!!

## Informações técnicas

Aplicativo template para ser usado em testes técnicos de Flutter.

**_Requisitos_**:

- Possuir Flutter 2.0.3 ou maior instalado.

---

**_Dependências_**:

- _Retrofit_: Utilizado para requisições HTTP;
  - _Retrofit_Generator_: Gerador de códigos para o Retrofit;
- _Dio_: Utilizado pelo retrofit para requisições HTTP;
- _Build_Runner_: Gerador de códigos;
- _mobx_: Utilizado para gerenciamento de estado;

---

**_Comandos Uteis_**

> flutter pub run build_runner build --delete-conflicting-outputs

Utilizado para geração de código, quando alteramos um arquivo que possua uma referencia a um arquivo com extensão .g .
_Obs - A referencia é encontrada na parte superior de um arquivo .dart, é representada da seguinte forma:_

```dart
part 'nome_arquivo.g.dart';
```

> flutter clean

Utilizado para limpar o cache das dependências no projeto.
Obs: Sempre após rodar `flutter clean`, rodar `flutter pub get` .

> flutter pub get

Utilizado para baixar dependências do projeto.

**_API_**

Foi utilizado uma MockApi para requisições das coleções, esta api devolve responses estáticas.

**_Base URL:_** *https://608ee93a0294cd001765df53.mockapi.io/api/v1*

**Endpoints:**
` GET('/collections')`// Retorna uma lista de coleções de livros

> Exemplo: _[https://65e755b953d564627a8e90d1.mockapi.io/api/v1/collections](https://65e755b953d564627a8e90d1.mockapi.io/api/v1/)_

Response:

```json
[
  {
    "name": "Coleção 1",
    "id": "some_id",
    "books": [
      {
        "id": "some_book_id",
        "name": "Livro",
        "author": "Author",
        "pages": 300,
        "releaseYear": 2021,
        "thumb": "book_cover"
      }
    ]
  }
]
```

`GET('/collections/:id')` //Retorna uma coleção de livros especifica.

> Exemplo: _[https://65e755b953d564627a8e90d1.mockapi.io/api/v1/:id](https://65e755b953d564627a8e90d1.mockapi.io/api/v1/)_

Response:

```json
{
  "name": "Coleção 1",
  "id": "some_id",
  "books": [
    {
      "id": "some_book_id",
      "name": "Livro",
      "author": "Author",
      "pages": 300,
      "releaseYear": 2021,
      "thumb": "book_cover"
    }
  ]
}
```
