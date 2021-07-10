enum EventType { Online, Offline } // event is either online or offline

extension EventTypeExtension on EventType {
  static const Map<EventType, String> keys = {
    EventType.Online: "Online",
    EventType.Offline: "Offline"
  };

  static const Map<EventType, String> values = {
    EventType.Online: "Online Event",
    EventType.Offline: "Offline Event"
  };

  String? get key => keys[this];
  String? get value => values[this];
}

enum DateTimeEnum {
  StartDate,
  StratTime,
  EndDate,
  EndTime,
  StartDateTime,
  EndDateTime
}

extension DateTimeEnumExtension on DateTimeEnum {
  static const Map<DateTimeEnum, String> keys = {
    DateTimeEnum.StartDate: "StartDate",
    DateTimeEnum.StratTime: "StartTime",
    DateTimeEnum.StartDateTime: "StartDateTime",
    DateTimeEnum.EndDate: "EndDate",
    DateTimeEnum.EndTime: "EndTime",
    DateTimeEnum.EndDateTime: "EndDateTime",
  };

  static const Map<DateTimeEnum, String> values = {
    DateTimeEnum.StartDate: "Start Date",
    DateTimeEnum.StratTime: "Start Time",
    DateTimeEnum.StartDateTime: "Start Date Time",
    DateTimeEnum.EndDate: "End Date",
    DateTimeEnum.EndTime: "End Time",
    DateTimeEnum.EndDateTime: "End Date Time",
  };

  String? get key => keys[this];
  String? get value => values[this];
}

enum SnackBarMessageType { ERROR, LOADING, INFO }

extension SnackBarMessageTypeExtension on SnackBarMessageType {
  static const Map<SnackBarMessageType, String> keys = {
    SnackBarMessageType.ERROR: "Error",
    SnackBarMessageType.LOADING: "Loading",
    SnackBarMessageType.INFO: "Info",
  };

  static const Map<SnackBarMessageType, String> values = {
    SnackBarMessageType.ERROR: "Error Message",
    SnackBarMessageType.LOADING: "Loading Message",
    SnackBarMessageType.INFO: "Info Message",
  };

  String? get key => keys[this];
  String? get value => values[this];
}
