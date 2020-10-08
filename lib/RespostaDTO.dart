class RespostaDTO {
  final String texto;
  final int pontuacao;

  RespostaDTO({this.texto, this.pontuacao});

  factory RespostaDTO.fromJson(Map<String, dynamic> json) {
    return RespostaDTO(
      texto: json['texto'] as String,
      pontuacao: json['pontuacao'] as int,
    );
  }
}
