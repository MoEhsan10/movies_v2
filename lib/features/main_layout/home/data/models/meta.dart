class Meta {
  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : serverTime = json['server_time'] as int,
        serverTimezone = json['server_timezone'] as String,
        apiVersion = json['api_version'] as int,
        executionTime = json['execution_time'] as String;

  final int serverTime;
  final String serverTimezone;
  final int apiVersion;
  final String executionTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['server_time'] = serverTime;
    map['server_timezone'] = serverTimezone;
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }
}