Feature: Enforce least-privilege IAM policies before apply

  Scenario: IAM policy actions must not be wildcard
    Given I have aws_iam_policy defined
    Then it must contain policy
    And its value must not contain "\"Action\":\"*\""

  Scenario: IAM policy resources must not be wildcard
    Given I have aws_iam_policy defined
    Then it must contain policy
    And its value must not contain "\"Resource\":\"*\""
