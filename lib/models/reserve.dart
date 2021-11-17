import 'dart:convert';

class Reserve {
  String codigo;
  DateTime dataHoraInicio;
  DateTime dataHoraFim;
  String tarifaTipo;
  String tarifaGrupo;
  String tarifaServico;
  String cidade;
  String estado;
  String localOrigem;
  String localDestino;
  String obsOrigem;
  String obsDestino;
  String passageiros;
  String contato;
  String centroCusto;
  double valor;
  double taxaServico;

  Reserve({
    required this.codigo,
    required this.dataHoraInicio,
    required this.dataHoraFim,
    required this.tarifaTipo,
    required this.tarifaGrupo,
    required this.tarifaServico,
    required this.cidade,
    required this.estado,
    required this.localOrigem,
    required this.localDestino,
    required this.obsOrigem,
    required this.obsDestino,
    required this.passageiros,
    required this.contato,
    required this.centroCusto,
    required this.valor,
    required this.taxaServico,
  });

  Reserve welcomeFromJson(String str) => Reserve.fromJson(json.decode(str));

  String welcomeToJson(Reserve data) => json.encode(data.toJson());

  factory Reserve.fromJson(Map<String, dynamic> json) => Reserve(
        codigo: json["codigo"],
        dataHoraInicio: DateTime.parse(json["data_hora_inicio"]),
        dataHoraFim: DateTime.parse(json["data_hora_fim"]),
        tarifaTipo: json["tarifa_tipo"],
        tarifaGrupo: json["tarifa_grupo"],
        tarifaServico: json["tarifa_servico"],
        cidade: json["cidade"],
        estado: json["estado"],
        localOrigem: json["local_origem"],
        localDestino: json["local_destino"],
        obsOrigem: json["obs_origem"],
        obsDestino: json["obs_destino"],
        passageiros: json["passageiros"],
        contato: json["contato"],
        centroCusto: json["centro_custo"],
        valor: json["valor"].toDouble(),
        taxaServico: json["taxa_servico"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "data_hora_inicio": dataHoraInicio.toIso8601String(),
        "data_hora_fim": dataHoraFim.toIso8601String(),
        "tarifa_tipo": tarifaTipo,
        "tarifa_grupo": tarifaGrupo,
        "tarifa_servico": tarifaServico,
        "cidade": cidade,
        "estado": estado,
        "local_origem": localOrigem,
        "local_destino": localDestino,
        "obs_origem": obsOrigem,
        "obs_destino": obsDestino,
        "passageiros": passageiros,
        "contato": contato,
        "centro_custo": centroCusto,
        "valor": valor,
        "taxa_servico": taxaServico,
      };
}
