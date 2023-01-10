{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_mimic",
  "spriteId": {
    "name": "spr_mimic",
    "path": "sprites/spr_mimic/spr_mimic.yy",
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
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":8,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"transformDist","varType":0,"value":"1 * WORLD.CELL_SIZE","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"stateScript","path":"objects/enemies/enemies.yy",},"objectId":{"name":"enemies","path":"objects/enemies/enemies.yy",},"value":"scr_mimic",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"passiveSprite","path":"objects/enemies/enemies.yy",},"objectId":{"name":"enemies","path":"objects/enemies/enemies.yy",},"value":"spr_mimic",},
  ],
  "parent": {
    "name": "entities",
    "path": "folders/Objects/entities.yy",
  },
}