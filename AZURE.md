## Azure App logging

### config
```
az webapp log config --name nexus3 --resource-group swfactory --docker-container-logging filesystem
```
### tail
```
az webapp log tail --name nexus3 --resource-group swfactory    
```
