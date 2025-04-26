enum JobStatusEnum { onWork, terminated, resigned }

class JobStatus {
  static const String onWork = 'onWork';
  static const String terminated = 'terminated';
  static const String resigned = 'resigned';

  static String getRole(JobStatusEnum role) => role.name;
}
