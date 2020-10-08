import 'package:exemplo/RespostaDTO.dart';

class QuestaoDTO {
  QuestaoDTO({this.texo, this.respostaList});

  final String texo;

  final List<RespostaDTO> respostaList;

  factory QuestaoDTO.fromJson(Map<String, dynamic> json) => QuestaoDTO(
      texo: json["texo"],
      respostaList: (json["respostas"] as List)
          .map((conteudo) => RespostaDTO.fromJson(conteudo))
          .toList());
}
