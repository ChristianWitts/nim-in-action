import configurator

config MyAppConfig:
  address: string
  port: int

var config = newMyAppConfig()
config.load("myapp.cfg")
echo("Configuration address: ", config.address)
echo("Configuration port: ", config.port)
