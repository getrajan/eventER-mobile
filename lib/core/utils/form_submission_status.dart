import 'package:eventer_app/core/errors/failure.dart';

abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmittingStatus extends FormSubmissionStatus {
  const FormSubmittingStatus();
}

class FormSubmissionSuccessStatus extends FormSubmittingStatus {
  final data;
  const FormSubmissionSuccessStatus(this.data);
}

class FormSubmissionFailedStatus extends FormSubmissionStatus {
  final String error;

  const FormSubmissionFailedStatus(this.error);
}
