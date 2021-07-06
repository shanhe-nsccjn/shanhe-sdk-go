# Read the Gherkin grammar here: https://cucumber.io/docs/reference

@service
Feature: the ShanHe service
  The ShanHe service should be available
  As a ShanHe user
  I can list all zones

  Scenario: need to use ShanHe service
    When initialize ShanHe service
    Then the ShanHe service is initialized

  Scenario: need to use instance service
    When initialize instance service
    Then the instance service is initialized

  Scenario: need to use job service
    When initialize job service
    Then the job service is initialized

  # DescribeZones
  Scenario: want to know all ShanHe zones
    When describe zones
    Then describe zones should get 1 zone at least
    Then describe zones should have the zone I'm using

  # RunInstances
  Scenario: need instance
    Given instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run instances
    Then run instances should get a job ID
    Then run instances will be finished

  # TerminateInstances
  Scenario: need to remove instance
    When terminate instances
    Then terminate instances should get a job ID
    Then terminate instances will be finished

  # DescribeJobs
  Scenario: want to know all jobs
    When describe jobs
    Then describe jobs should get 2 job at least
    Then describe jobs should have the jobs I just created
