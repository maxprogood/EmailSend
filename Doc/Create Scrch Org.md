1 Login to DevHub if not logged in.
Use your own developer account.
In this account must be enabled dev hub feature.
For enable Dev Hub got to Setup > Dev Hub
   ~~~
   sfdx force:auth:web:login -d -a devHubAlias
   ~~~
If you already logged in to devhub you can set this devhub as default with command:
   ~~~
   sfdx force:config:set defaultdevhubusername=devHubAlias
   ~~~
2 Create Scratch Org
~~~
sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -a 'Your Scratch Name'
~~~
3 Push project to scratch org
~~~
sfdx force:source:push
~~~
4 Apply scratch org in the IDE (Idea or Webstorm)
~~~
File > Settings > Languages and frameworks > Illuminate Cloud (...) > Select in conection column "Your Scratch Name"
~~~