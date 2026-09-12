function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'staging';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin',
    password: 'welcome',
    _url: 'http://localhost:9898'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.username ='author'
    config.password ='authorpassword'
  } else if (env == 'e2e') {
      config.username ='user'
      config.password ='userpassword'
    // customize
  }else if (env == 'staging') {
//  Initialize the config for staging
    config.username ='staging',
    config.password ='stagingwelcome',
    _url= 'http://staging.localhost:9898'
  }else if (env == 'preprod') {
//  Initialize the config for preprod
    config.username = 'preprod',
    config.password ='preprodwelcome',
    _url= 'http://preprod.localhost:9898'
   }else if (env == 'prod') {
//  Initialize the config for prod
    config.username ='prod',
    config.password = 'prodwelcome',
    _url= 'http://prod.localhost:9898'
    }

  return config;
}