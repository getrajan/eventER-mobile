import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

abstract class ExploreRemoteSource {
  Future<List<EventEntity>> getInterestedEvents();
}

class IExploreRemoteSource implements ExploreRemoteSource {
  @override
  Future<List<EventEntity>> getInterestedEvents() async {
    List<EventEntity> upcommingEvents = [
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
    return upcommingEvents;
  }
}
