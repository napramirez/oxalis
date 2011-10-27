
----------------------------------------------------------------------------
Normal cycle
----------------------------------------------------------------------------

rm /usr/local/apache-tomcat-7.0.21/logs/oxalis.log
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
mvn -Pnmp install
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-inbound
mvn -Pnmp package -Dmaven.test.skip=true cargo:deployer-undeploy cargo:deployer-deploy
cd /usr/local/apache-tomcat-7.0.21/logs
tail -f -n 300 oxalis.log

----------------------------------------------------------------------------
Clean cycle
----------------------------------------------------------------------------

rm /usr/local/apache-tomcat-7.0.21/logs/oxalis.log
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
mvn -Pnmp clean install
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-inbound
mvn -Pnmp package -Dmaven.test.skip=true cargo:deployer-undeploy cargo:deployer-deploy
cd /usr/local/apache-tomcat-7.0.21/logs
tail -f -n 300 oxalis.log

cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-standalone
mvn install exec:java -Dexec.mainClass=no.sendregning.oxalis.TestStandAloneWSClient



cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
mvn -Pnmp clean install
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-inbound
mvn -Pnmp package -Dmaven.test.skip=true cargo:deployer-undeploy cargo:deployer-deploy
cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-standalone
mvn install exec:java -Dexec.mainClass=no.sendregning.oxalis.Main



cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
git status
git log
git mv oxalis-start-server oxalis-start-inbound
git commit -a -m 'Rename modules'

./fetch-metadata.sh 9908:983974724
./fetch-metadata.sh 9902:DK28158815




cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-outbound
mvn -Pnmp test

cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-inbound
mvn -Pnmp test


cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
mvn -Pnmp install

cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis/oxalis-start-inbound
mvn -Pnmp package -Dmaven.test.skip=true cargo:deployer-undeploy


cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
git status
git commit -a -m "Refaktorering, innebygget truststore, konvertert til WSDL 2.0"
git push origin master

cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
find . -name .svn
find . -name .svn |xargs rm -rf

cd /usr/local/apache-tomcat-7.0.21/bin
/usr/local/apache-tomcat-7.0.21/bin/shutdown.sh
cd /usr/local/apache-tomcat-7.0.21/logs
tail -f -n 300 catalina.out

rm /usr/local/apache-tomcat-7.0.21/logs/catalina.out
cd /usr/local/apache-tomcat-7.0.21/bin
/usr/local/apache-tomcat-7.0.21/bin/startup.sh
cd /usr/local/apache-tomcat-7.0.21/logs
tail -f -n 300 catalina.out


cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis
mvn dependency:tree
mvn dependency:analyze


----------------------------------------------------------------------------
Standalone
----------------------------------------------------------------------------

cd /Users/nigel/Filer/mazeppa/SendRegning/sr-peppol/oxalis-standalone
mvn idea:idea
mvn dependency:tree