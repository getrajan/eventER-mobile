import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

abstract class LocalProfileDataSource {
  Future<List<EventEntity>> getInterestedEvents();
}

class ILocalProfileDataSource implements LocalProfileDataSource {
  @override
  Future<List<EventEntity>> getInterestedEvents() async {
    List<EventEntity> interestedEvents = [
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
      EventEntity(
          title: "Node.js Basic Workshop",
          date: "Thus, July 08 at 12:00 PM",
          location: "Unlimited Technology, New Road",
          coverPhoto: "https://i.ytimg.com/vi/rFOJtknWGg8/maxresdefault.jpg"),
    ];
    return List<EventEntity>.from(interestedEvents.toList());
  }
}
