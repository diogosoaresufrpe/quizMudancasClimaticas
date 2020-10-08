import 'dart:convert';

import 'package:exemplo/questaoDTO.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
import 'package:http/http.dart' as http;

import 'RespostaDTO.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _url = 'https://exemploflutterfpa.firebaseio.com/questionario.json';
  bool _isQuestionarioCarregado = false;
  bool _isFireBasePopulado = false;
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  //List<Map<String, Object>> _perguntas = [];
  //Map<String, Object>  _perguntas = [];

  List<Map<String, Object>> _perguntas = [];

  void inserirDadosFireBase() {
    if (!_isFireBasePopulado) {
      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                '11111 A poluição emitida da superfície para a atmosfera em regiões metropolitanas pode apresentar maior concentração e causar mais danos à saúde humana durante os períodos de inverno nas regiões sul, sudeste e centro-oeste do Brasil, devido, principalmente, à:',
            'respostas': [
              {
                'texto':
                    'inversão térmica causada pela diminuição da temperatura do ar com a altitude, no início da manhã.',
                'pontuacao': 1
              },
              {
                'texto':
                    'diminuição da temperatura do ar com a altitude em grandes massas de ar sobre a região.',
                'pontuacao': 0
              },
              {
                'texto':
                    'diminuição da turbulência do ar associada ao aumento da rugosidade do terreno.',
                'pontuacao': 0
              },
              {
                'texto':
                    'inversão térmica causada pela subsidência de grande escala de massas de ar de níveis superiores da atmosfera.',
                'pontuacao': 0
              },
              {
                'texto':
                    'inversão térmica causada pela diminuição da umidade do ar com a altitude.',
                'pontuacao': 0
              },
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                'Problema típico das grandes cidades e muito frequente no inverno. O ar quente, constituído, principalmente. ',
            'respostas': [
              {'texto': 'Ilhas de Calor', 'pontuacao': 1},
              {'texto': 'Efeito estufa.', 'pontuacao': 0},
              {'texto': 'Inversão térmica', 'pontuacao': 0},
              {'texto': 'Chuvas ácidas', 'pontuacao': 0},
              {'texto': 'El ninho', 'pontuacao': 0},
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto': 'Entende-se por ilha de calor:',
            'respostas': [
              {
                'texto':
                    'O fenômeno climático que ocorre a partir da elevação da temperatura de uma área urbana se comparada a uma zona rural.',
                'pontuacao': 1
              },
              {
                'texto':
                    'O fenômeno atmosférico de milhares de metros de espessura que ocorre no topo.',
                'pontuacao': 0
              },
              {
                'texto':
                    'O fenômeno natural de aquecimento térmico da terra, essencial para manter a temperatura do planeta.',
                'pontuacao': 0
              },
              {
                'texto':
                    'A poluição do ar, sobretudo em áreas urbanas, por ozônio troposférico e outros compostos.',
                'pontuacao': 0
              },
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                'A chuva ácida é a consequência mais imediata do uso de combustíveis fósseis introduzida pela industrialização. São consideradas as principais consequências da chuva ácida, EXCETO: ',
            'respostas': [
              {
                'texto':
                    'O uso de combustíveis fósseis introduzida pela industrialização.',
                'pontuacao': 1
              },
              {
                'texto': 'Melhoria na qualidade de vida da população.',
                'pontuacao': 0
              },
              {
                'texto': 'Piora na qualidade de vida da população.',
                'pontuacao': 0
              },
              {
                'texto': 'Destruição da vida vegetal e animal em lagos e rios.',
                'pontuacao': 0
              },
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                'Sobre qual dos seguintes efeitos das mudanças climáticas existe um forte consenso na comunidade científica?',
            'respostas': [
              {
                'texto':
                    'A frequência das secas regionais diminuirá devido ao maior conteúdo de umidade na atmosfera.',
                'pontuacao': 1
              },
              {
                'texto':
                    'A velocidade do vento aumentará globalmente em resposta ao aumento da temperatura',
                'pontuacao': 0
              },
              {
                'texto':
                    'Os extremos de precipitação diminuirão na maior parte do globo.',
                'pontuacao': 0
              },
              {
                'texto':
                    'A temperatura média global subirá no decorrer do século XXI.',
                'pontuacao': 0
              },
              {
                'texto':
                    'As geleiras andinas desaparecerão completamente entre 2020 e 2030.',
                'pontuacao': 0
              },
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                'Considerando as observações históricas da temperatura global, qual dos períodos listados a seguir tem maior probabilidade de mostrar tendência de diminuição da temperatura? ',
            'respostas': [
              {'texto': '10 anos', 'pontuacao': 1},
              {'texto': '30 anos', 'pontuacao': 0},
              {'texto': '100 anos', 'pontuacao': 0},
              {'texto': '1.000 anos', 'pontuacao': 0},
              {'texto': '100.000 anos', 'pontuacao': 0},
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode(
          {
            'texto':
                'As grandes regiões desérticas e chuvosas do globo terrestre estão associadas aos movimentos das células de circulação meridional global dos movimento descendente do ar, próximo às latitudes de 60 graus (nos hemisférios norte e sul) e... ',
            'respostas': [
              {
                'texto':
                    'em latitudes equatoriais, e movimento ascendente próximo às latitudes subtropicais (nos hemisférios norte e sul).',
                'pontuacao': 1
              },
              {
                'texto':
                    'em latitudes equatoriais, e movimento ascendente próximo às latitudes subtropicais (nos hemisférios norte e sul).',
                'pontuacao': 0
              },
              {
                'texto':
                    'em regiões equatoriais, e movimento descendente do ar próximo às latitudes subtropicais (no hemisfério sul).',
                'pontuacao': 0
              },
              {
                'texto':
                    'em regiões equatoriais, e movimento descendente do ar próximo às latitudes subtropicais (nos hemisférios norte e sul).',
                'pontuacao': 0
              },
            ],
          },
        ),
      );

      http.post(
        _url,
        body: json.encode({
          'texto':
              'Assinale a alternativa que contém a principal consequência da grande dependência que os seres humanos têm em relação ao petróleo e ao carvão mineral.?',
          'respostas': [
            {
              'texto': 'Emissão de CO2 e o aquecimento global.',
              'pontuacao': 1,
            },
            {
              'texto': 'Emissão de vapor e aumento das chuvas no planeta',
              'pontuacao': 0
            },
            {
              'texto': 'Alteração da composição da água potável, na Terra',
              'pontuacao': 0
            },
            {
              'texto': 'Aumento da camada de ozônio na estratosfera',
              'pontuacao': 0
            },
          ],
        }),
      );
      http.post(
        _url,
        body: json.encode({
          'texto': 'Entende-se por ilha de calor:',
          'respostas': [
            {
              'texto':
                  'O fenômeno climático que ocorre a partir da elevação da temperatura de uma área urbana se comparada a uma zona rural.',
              'pontuacao': 1
            },
            {
              'texto':
                  'O fenômeno atmosférico de milhares de metros de espessura que ocorre no topo.',
              'pontuacao': 0
            },
            {
              'texto':
                  'O fenômeno natural de aquecimento térmico da terra, essencial para manter a temperatura do planeta.',
              'pontuacao': 0
            },
            {
              'texto':
                  'A poluição do ar, sobretudo em áreas urbanas, por ozônio troposférico e outros compostos.',
              'pontuacao': 0
            },
          ],
        }),
      );

      http.post(
        _url,
        body: json.encode({
          'texto':
              'Problema típico das grandes cidades e muito frequente no inverno. O ar quente, constituído, principalmente. ',
          'respostas': [
            {'texto': 'Ilhas de Calor', 'pontuacao': 1},
            {'texto': 'Efeito estufa.', 'pontuacao': 0},
            {'texto': 'Inversão térmica', 'pontuacao': 0},
            {'texto': 'Chuvas ácidas', 'pontuacao': 0},
            {'texto': 'El ninho', 'pontuacao': 0},
          ],
        }),
      );

      http.post(
        _url,
        body: json.encode({
          'texto':
              'A poluição emitida da superfície para a atmosfera em regiões metropolitanas pode apresentar maior concentração e causar mais danos à saúde humana durante os períodos de inverno nas regiões sul, sudeste e centro-oeste do Brasil, devido, principalmente, à:',
          'respostas': [
            {
              'texto':
                  'inversão térmica causada pela diminuição da temperatura do ar com a altitude, no início da manhã.',
              'pontuacao': 1
            },
            {
              'texto':
                  'diminuição da temperatura do ar com a altitude em grandes massas de ar sobre a região.',
              'pontuacao': 0
            },
            {
              'texto':
                  'diminuição da turbulência do ar associada ao aumento da rugosidade do terreno.',
              'pontuacao': 0
            },
            {
              'texto':
                  'inversão térmica causada pela subsidência de grande escala de massas de ar de níveis superiores da atmosfera.',
              'pontuacao': 0
            },
            {
              'texto':
                  'inversão térmica causada pela diminuição da umidade do ar com a altitude.',
              'pontuacao': 0
            },
          ],
        }),
      );

      http.post(
        _url,
        body: json.encode({
          'texto':
              'Característica que pode ser afetada, afastando a vida marinha e provocando grandes problemas para a indústria pesqueira no Peru. O fenômeno responsável por esta variação é conhecido como: ',
          'respostas': [
            {'texto': 'Aquecimento global.', 'pontuacao': 1},
            {'texto': 'Intemperismo marítimo.', 'pontuacao': 0},
            {'texto': 'El niño.', 'pontuacao': 0},
            {'texto': 'Chuvas ácidas', 'pontuacao': 0},
            {'texto': 'Voçoroca marinha.', 'pontuacao': 0},
          ],
        }),
      );
      _isFireBasePopulado = true;
    }
  }

  void _responder(int pontuacao, context) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
        if (pontuacao != 0) {
          showAlertDialogAcertou(context);
        } else {
          showAlertDialogErrou(context);
        }
      });
    }
  }

  showAlertDialogAcertou(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("Próxima questão->"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Acertou"),
      content: Text("Parabens."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialogErrou(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("Próxima Questão"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Errou!"),
      content: Text("Melhor sorte na próxima vez..."),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void _reiniciarQuestionario() {
    setState(() {
      loadQuestionario();
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Future<void> loadQuestionario() async {
    if (!_isQuestionarioCarregado) {
      final response = await http.get(_url);

      Map<String, dynamic> data = json.decode(response.body);
      if (data == null) {
        inserirDadosFireBase();
        data = json.decode(response.body);
      }

      data.forEach((key, value) {
        List<RespostaDTO> respostaList = (value["respostas"] as List)
            .map((respostaDTO) => RespostaDTO.fromJson(respostaDTO))
            .toList();

        Map<String, Object> questao = {
          'texto': value['texto'],
          'respostas': [
            {
              'texto': respostaList[0].texto,
              'pontuacao': respostaList[0].pontuacao,
            },
            {
              'texto': respostaList[1].texto,
              'pontuacao': respostaList[1].pontuacao,
            },
            {
              'texto': respostaList[2].texto,
              'pontuacao': respostaList[2].pontuacao,
            },
            {
              'texto': respostaList[3].texto,
              'pontuacao': respostaList[3].pontuacao,
            },
          ],
        };
        _perguntas.add(questao);
      });

      print(_perguntas);

      _isQuestionarioCarregado = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mestrado PPGIA - Projeto FPA - Questões'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
