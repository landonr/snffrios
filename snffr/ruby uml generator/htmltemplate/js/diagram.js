var entities =
[{
  "id": 1,
  "typeString": "struct",
  "properties": [
    {
  "name": "let height",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let careGiverId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let updatedAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let name",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let about",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let dogId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let createdAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let adoptionStatus",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let version",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let age",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let weight",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let dogTypeId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let profileUrl",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "SerializationKeys"
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var height: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var careGiverId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var updatedAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var name: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var about: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var dogId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var createdAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var adoptionStatus: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var version: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var age: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var weight: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var dogTypeId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var profileUrl: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var image: UIImage?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var medicals: Array<Medical>?",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "methods": [
    {
  "name": "downloadImage(indexpathRow: Int, completion: @escaping (Bool, Int) -> Swift.Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "dictionaryRepresentation() -> [String: Any]",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "encode(with aCoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "protocols": [
    10
  ],
  "name": "Dog",
  "superClass": 9,
  "containedEntities": [
    1
  ]
},{
  "id": 3,
  "typeString": "struct",
  "properties": [
    {
  "name": "let updatedAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let addressId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let userTypeId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let createdAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let lastName",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let version",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let userId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let firstName",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let phoneId",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "SerializationKeys"
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "var updatedAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var addressId: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var userTypeId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var createdAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var lastName: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var version: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var userId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var firstName: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var phoneId: String?",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "dictionaryRepresentation() -> [String: Any]",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "encode(with aCoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "Foster",
  "superClass": 9,
  "containedEntities": [
    3
  ]
},{
  "id": 5,
  "typeString": "struct",
  "properties": [
    {
  "name": "let updatedAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let dogId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let requestingPartyId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let incidentTypeId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let incidentStatusId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let createdAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let version",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let message",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let incidentId",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "SerializationKeys"
},{
  "id": 6,
  "typeString": "class",
  "properties": [
    {
  "name": "var updatedAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var dogId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var requestingPartyId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var incidentTypeId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var incidentStatusId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var createdAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var version: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var message: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var incidentId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var dog: Dog?",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "dictionaryRepresentation() -> [String: Any]",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "encode(with aCoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(message: String)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "Incident",
  "superClass": 9,
  "containedEntities": [
    5
  ]
},{
  "id": 7,
  "typeString": "struct",
  "properties": [
    {
  "name": "let updatedAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let dogId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let createdAt",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let info",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let version",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let medicalInfoId",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let medicalInfoTypeId",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "SerializationKeys"
},{
  "id": 8,
  "typeString": "class",
  "properties": [
    {
  "name": "var updatedAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var dogId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var createdAt: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var info: String?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var version: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var medicalInfoId: Int?",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var medicalInfoTypeId: Int?",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "dictionaryRepresentation() -> [String: Any]",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "encode(with aCoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "Medical",
  "superClass": 9,
  "containedEntities": [
    7
  ]
},{
  "id": 9,
  "typeString": "class",
  "name": "Mappable"
},{
  "id": 10,
  "typeString": "protocol",
  "name": "NSCoding"
}]
;

var renderedEntities = [];

var useCentralNode = true;

var templates = {
  case: undefined,
  property: undefined,
  method: undefined,
  entity: undefined,
  data: undefined,

  setup: function() {
    this.case = document.getElementById("case").innerHTML;
    this.property = document.getElementById("property").innerHTML;
    this.method = document.getElementById("method").innerHTML;
    this.entity = document.getElementById("entity").innerHTML;
    this.data = document.getElementById("data").innerHTML;

    Mustache.parse(this.case)
    Mustache.parse(this.property);
    Mustache.parse(this.method);
    Mustache.parse(this.entity);
    Mustache.parse(this.data);
  }
}

var colorSuperClass = { color: "#848484", highlight: "#848484", hover: "#848484" }
var colorProtocol = { color: "#9a2a9e", highlight: "#9a2a9e", hover: "#9a2a9e" }
var colorExtension = { color: "#2a8e9e", highlight: "#2a8e9e", hover: "#2a8e9e" }
var colorContainedIn = { color: "#99AB22", highlight: "#99AB22", hover: "#99AB22" }
var centralNodeColor = "rgba(0,0,0,0)";
var centralEdgeLengthMultiplier = 1;
var network = undefined;

function bindValues() {
    templates.setup();

    for (var i = 0; i < entities.length; i++) {
        var entity = entities[i];
        var entityToBind = {
            "name": entity.name == undefined ? entity.typeString : entity.name,
            "type": entity.typeString,
            "props": renderTemplate(templates.property, entity.properties),
            "methods": renderTemplate(templates.method, entity.methods),
            "cases": renderTemplate(templates.case, entity.cases)
        };
        var rendered = Mustache.render(templates.entity, entityToBind);
        var txt = rendered;
        document.getElementById("entities").innerHTML += rendered;
    }

    setSize();
    setTimeout(startCreatingDiagram, 100);
}

function renderTemplate(template, list) {
    if (list != undefined && list.length > 0) {
        var result = "";
        for (var i = 0; i < list.length; i++) {
            var temp = Mustache.render(template, list[i]);
            result += temp;
        }
        return result;
    }
    return undefined;
}

function getElementSizes() {
  var strings = [];
  var elements = $("img");

  for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      
      var elementData = {
        width: element.offsetWidth,
        height: element.offsetHeight
      };
      strings.push(elementData);
  }
  return strings;
}

function renderEntity(index) {
  if (index >= entities.length) {
    // create the diagram
    $("#entities").html("");
    setTimeout(createDiagram, 100);
    return;
  }
  html2canvas($(".entity")[index], {
    onrendered: function(canvas) {
      var data = canvas.toDataURL();
      renderedEntities.push(data);
      var img = Mustache.render(templates.data, {data: data}); 
      $(document.body).append(img);

      renderEntity(index + 1);
    }
  });
}

function startCreatingDiagram() {
  renderedEntities = [];
  renderEntity(0);
}

function createDiagram() {
  var entitySizes = getElementSizes();

  var nodes = [];
  var edges = [];

  var edgesToCentral = [];
  var maxEdgeLength = 0;
  for (var i = 0; i < entities.length; i++) {
    var entity = entities[i];
    var data = entitySizes[i];
    var length = Math.max(data.width, data.height) * 1.5;
    var hasDependencies = false;

    maxEdgeLength = Math.max(maxEdgeLength, length);

    nodes.push({id: entity.id, label: undefined, image: renderedEntities[i], shape: "image", shapeProperties: {useImageSize: true } });
    if (entity.superClass != undefined && entity.superClass > 0) {
      edges.push({from: entity.superClass, to: entity.id, length: length, color: colorSuperClass, label: "inherits", arrows: {from: true} });
      
      hasDependencies = true;
    }

    var extEdges = getEdges(entity.id, entity.extensions, length, "extends", colorExtension, {from: true});
    var proEdges = getEdges(entity.id, entity.protocols, length, "conforms to", colorProtocol, {to: true});
    var conEdges = getEdges(entity.id, entity.containedEntities, length, "contained in", colorContainedIn, {from: true});

    hasDependencies = hasDependencies && extEdges.length > 0 && proEdges.length > 0 && conEdges.length > 0;

    edges = edges.concat(extEdges);
    edges = edges.concat(proEdges);
    edges = edges.concat(conEdges);

    if (!hasDependencies && useCentralNode)
    {
      edgesToCentral.push({from: entity.id, to: -1, length: length * centralEdgeLengthMultiplier, color: centralNodeColor, arrows: {from: true} });
    }
  }

  if (edgesToCentral.length > 1) {
    edges = edges.concat(edgesToCentral);
    nodes.push({id: -1, label: undefined, shape: "circle", color: centralNodeColor });
  }

  var container = document.getElementById("classDiagram");
  var dataToShow = {
      nodes: nodes,
      edges: edges
  };
  var options = {
      "edges": { "smooth": false },
      "physics": {
        "barnesHut": {
          "gravitationalConstant": -7000,
          "springLength": maxEdgeLength,
          "avoidOverlap": 1
        }
      },
      //configure: true
  };
  network = new vis.Network(container, dataToShow, options);

  $("#entities").html("");
  $("img").remove();

  setTimeout(disablePhysics, 200);
}

function disablePhysics()
{
  var options = {
      "edges": { "smooth": false },
      "physics": { "enabled": false }
  };
  network.setOptions(options);
  $(".loading-overlay").fadeOut("fast");
}

function getEdges(entityId, arrayToBind, edgeLength, label, color, arrows) {
  var result = [];
  if (arrayToBind != undefined && arrayToBind.length > 0) {
      for (var i = 0; i < arrayToBind.length; i++) {
        result.push({from: entityId, to: arrayToBind[i], length: edgeLength, color: color, label: label, arrows: arrows });
      }
  }
  return result;   
}

function setSize() {
  var width = $(window).width();
  var height = $(window).height();

  $("#classDiagram").width(width - 5);
  $("#classDiagram").height(height - 5);
}