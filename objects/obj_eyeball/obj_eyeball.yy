{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_eyeball",
  "spriteId": {
    "name": "spr_eyeballPassiveDemo",
    "path": "sprites/spr_eyeballPassiveDemo/spr_eyeballPassiveDemo.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "enemies",
    "path": "objects/enemies/enemies.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":1,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":2,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":8,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":53,"eventType":6,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"aggroSprite","varType":5,"value":"spr_eyeballAggroDemo","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"passiveSprite","path":"objects/enemies/enemies.yy",},"objectId":{"name":"enemies","path":"objects/enemies/enemies.yy",},"value":"spr_eyeballPassiveDemo",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"chaseSprite","path":"objects/enemies/enemies.yy",},"objectId":{"name":"enemies","path":"objects/enemies/enemies.yy",},"value":"spr_eyeballAggroingDemo",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"stateScript","path":"objects/enemies/enemies.yy",},"objectId":{"name":"enemies","path":"objects/enemies/enemies.yy",},"value":"scr_eyeball",},
  ],
  "parent": {
    "name": "entities",
    "path": "folders/Objects/entities.yy",
  },
}