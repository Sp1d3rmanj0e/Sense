{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_difficulty",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": null,
  "views": [
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3C117BCC","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Back\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"roomCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"rm_intro",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":555.0,"y":674.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5332F901","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Easy\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"executeCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"[scr_button,DIFF.EASY]",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":683.0,"y":228.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1B0871F1","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"executeCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"[scr_button,DIFF.MEDIUM]",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Medium\"",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":683.0,"y":324.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4C8F0476","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Harder\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"executeCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"[scr_button,DIFF.HARDER]",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":683.0,"y":516.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7054C7FE","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Hard\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"executeCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"[scr_button,DIFF.HARD]",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":683.0,"y":420.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_12F0C74C","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Go!\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"roomCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"Room1",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":811.0,"y":674.0,},
      ],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":null,"colour":4278190080,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_3C117BCC","path":"rooms/rm_difficulty/rm_difficulty.yy",},
    {"name":"inst_5332F901","path":"rooms/rm_difficulty/rm_difficulty.yy",},
    {"name":"inst_1B0871F1","path":"rooms/rm_difficulty/rm_difficulty.yy",},
    {"name":"inst_4C8F0476","path":"rooms/rm_difficulty/rm_difficulty.yy",},
    {"name":"inst_7054C7FE","path":"rooms/rm_difficulty/rm_difficulty.yy",},
    {"name":"inst_12F0C74C","path":"rooms/rm_difficulty/rm_difficulty.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 1366,
    "Height": 768,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": false,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "start",
    "path": "folders/Rooms/start.yy",
  },
}