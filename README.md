```
oc new-app mysql:8.0 --binary --name dbms -e MYSQL_DATABASE=test -e MYSQL_USER=test -e MYSQL_PASSWORD='Test123!' --as-deployment-config

oc start-build dbms --from-dir=$PWD/dbms --follow
```

```
oc new-app --image-stream openshift/jboss-eap73-openshift:latest --binary --name=webapp --as-deployment-config

oc set env bc/webapp --overwrite --env=CUSTOM_INSTALL_DIRECTORIES=.

oc create configmap countries --from-file=webapp_cm/countries.txt
# oc create configmap ocp-binary-deploy-deployment-structure --from-file=webapp_cm/jboss-deployment-structure.xml

oc label configmap countries app=webapp
# oc label configmap ocp-binary-deploy-deployment-structure app=webapp

oc set volumes dc/webapp --add --name=countries --configmap-name=countries -m /PROPERTIES --overwrite -t configmap
# oc set volumes dc/webapp --add --name=ocp-binary-deploy-deployment-structure --configmap-name=ocp-binary-deploy-deployment-structure -m /myjboss/ --overwrite -t configmap

oc start-build webapp --from-dir=$PWD/webapp --follow
```
