Feature: Datatype Single pagina titel [DT-CDT-001]
  Specifiek titel voor de enkele code van de codelijst.
  Titel = Datatype LDT_Naam

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  @LD-286 @LD-143 @DT-CDT-001
  Scenario Outline: DT-CDT-001 heeft is vindbaar op de pagina met id 'DT-CDT-001'
#    Given driver 'https://istd-leverstraat.gitlab.io/dgpi/iwlz/datatypen/'
    Given driver 'https://istd-leverstraat.gitlab.io/dgpi/informatiemodel/iwlz/estafette/lopend/datatypen/'
    And def DataType = script('//*[@id=\'<dataTypeId>\']', '_.innerHTML')
    When   click('//*[@id=\'<dataTypeId>\']')
    Then waitFor("//h1[@id]")

    Examples:
      | read('dataTypen.csv') |

  @LD-286 @LD-143 @DT-CDT-001
  Scenario Outline: DT-CDT-001  heeft als patroon CDT/LDT + "_" + :titel
#    Given driver 'https://istd-leverstraat.gitlab.io/dgpi/iwlz/datatypen/'
    Given driver 'https://istd-leverstraat.gitlab.io/dgpi/informatiemodel/iwlz/estafette/lopend/datatypen/'
    And def DataType = script('//*[@id=\'<dataTypeId>\']', '_.innerHTML')
    When   click('//*[@id=\'<dataTypeId>\']')
    Then waitFor("//h1[@id]")
    Then match text("//h1[@id]") == '#regex ^(C|L)DT_[a-z A-Z]*'

    Examples:
      | read('dataTypen.csv') |


