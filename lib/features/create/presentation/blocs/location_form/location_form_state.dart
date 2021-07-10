part of 'location_form_cubit.dart';

class LocationFormState {
  const LocationFormState({this.location = ''});

  final String location;

  LocationFormState copyWith({
    String? location,
  }) {
    return LocationFormState(
      location: location ?? this.location,
    );
  }
}
