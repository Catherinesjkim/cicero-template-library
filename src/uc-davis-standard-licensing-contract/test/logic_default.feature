Feature: UC Davis Standard License
  This describe the expected behavior for the IPwe's UC Davis standard patent-license template

  Background:
    Given the default contract

  Scenario: Patent license calculates a pay out
    When the current time is "2020-05-11T16:34:00Z"
    And it receives the default request
    Then it should respond with
"""
{
   "$class": "org.accordproject.ucDavisStandardLicensingK.PayOut",
    "amount": {
      "$class" : "org.accordproject.money.MonetaryAmount",
      "doubleValue" : 100.00,
      "currencyCode" : "USD"
    }
}
"""

  Scenario: Payment of a specified amount should be made
    When the current time is "2020-05-11T16:34:00-05:00"
    And it receives the request
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PaymentRequest",
    "netSaleRevenue": 1200,
    "sublicensingRevenue": 450,
    "permissionGrantedBy": "2018-04-05T00:00:00-05:00"
}
"""
    Then it should respond with
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PayOut",
    "totalAmount": 77.4,
    "dueBy": "2018-04-12T00:00:00.000-05:00"
}
"""

Scenario: Payment of a specified amount should be made
    When the current time is "2020-05-11T16:34:00-02:00"
    And it receives the request
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PaymentRequest",
    "netSaleRevenue": 1550,
    "sublicensingRevenue": 225,
    "permissionGrantedBy": "2018-04-05T00:00:00-05:00"
}
"""
    Then it should respond with
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PayOut",
    "totalAmount": 81.45,
    "dueBy": "2020-04-12T03:00:00.000-02:00"
}
"""

Scenario: Payment of a specified amount should be made
    When the current time is "2020-02-14T16:34:00-07:00"
    And it receives the request
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PaymentRequest",
    "netSaleRevenue": 700,
    "sublicensingRevenue": 400,
    "permissionGrantedBy": "2020-04-05T00:00:00-05:00"
}
"""
    Then it should respond with
"""
{
    "$class": "org.accordproject.ucDavisStandardLicensingK.PayOut",
    "totalAmount": 52.3,
    "dueBy": "2020-04-11T22:00:00.000-07:00"
}
"""
