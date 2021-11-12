oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk8-image-stream.json

oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/eap74-basic-s2i.json

mvn clean package

cp target/ocp-app-0.1.0-SNAPSHOT.war extensions

oc new-project test

oc create configmap FE_PROPERTIES --from-file=FE_PROPERTIES/
oc label configmap FE_PROPERTIES app=ocp-app

oc new-app --image-stream openshift/jboss-eap73-openshift:latest --binary --name=ocp-app --as-deployment-config

oc set env bc/${APP_NAME} --overwrite --env=CUSTOM_INSTALL_DIRECTORIES=extensions

oc set volumes dc/ocp-app --add --name=FE_PROPERTIES --configmap-name=FE_PROPERTIES -m /FE_PROPERTIES --overwrite -t configmap

oc start-build ocp-app --from-dir=extensions --follow

oc create -f ....
