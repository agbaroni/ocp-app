oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk8-image-stream.json

oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/eap74-basic-s2i.json

mvn clean package

cp target/ocp-app-0.1.0-SNAPSHOT.war extensions

oc new-app --image-stream openshift/jboss-eap73-openshift:latest --binary --name=ocp-app

oc start-build ocp-app --from-dir=extensions --follow

oc create -f ....
