{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_intro",
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
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Assets","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_57439894","spriteId":{"name":"spr_intro","path":"sprites/spr_intro/spr_intro.yy",},"headPosition":0.0,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"animationSpeed":1.0,"colour":4294967295,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":683.0,"y":195.0,},
      ],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_595E0C61","properties":[],"isDnd":false,"objectId":{"name":"MACROS","path":"objects/MACROS/MACROS.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":-5.0,"y":-5.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4D9D234C","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"roomCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"rm_difficulty",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Start!\"",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":665.0,"y":363.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_50C58DD8","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Leaderboard\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"roomCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"rm_leaderboard",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":665.0,"y":447.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7921DFF8","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"executeCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"game_end",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Close\"",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":665.0,"y":531.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_17EAA43D","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"\"Testing\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"roomCode","path":"objects/obj_button/obj_button.yy",},"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"value":"rm_testingHub",},
          ],"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":665.0,"y":704.0,},
      ],"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":null,"colour":4281545523,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_595E0C61","path":"rooms/rm_intro/rm_intro.yy",},
    {"name":"inst_4D9D234C","path":"rooms/rm_intro/rm_intro.yy",},
    {"name":"inst_50C58DD8","path":"rooms/rm_intro/rm_intro.yy",},
    {"name":"inst_7921DFF8","path":"rooms/rm_intro/rm_intro.yy",},
    {"name":"inst_17EAA43D","path":"rooms/rm_intro/rm_intro.yy",},
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